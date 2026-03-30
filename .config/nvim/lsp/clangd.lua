local function switch_source_header(bufnr, client)
    local method_name = 'textDocument/switchSourceHeader'
    ---@diagnostic disable-next-line:param-type-mismatch
    if not client or not client:supports_method(method_name) then
        return vim.notify(('method %s is not supported by any servers active on the current buffer'):format(method_name))
    end
    local params = vim.lsp.util.make_text_document_params(bufnr)
    ---@diagnostic disable-next-line:param-type-mismatch
    client:request(method_name, params, function(err, result)
        if err then
            error(tostring(err))
        end
        if not result then
            vim.notify('corresponding file cannot be determined')
            return
        end
        vim.cmd.edit(vim.uri_to_fname(result))
    end, bufnr)
end

local function symbol_info(bufnr, client)
    local method_name = 'textDocument/symbolInfo'
    ---@diagnostic disable-next-line:param-type-mismatch
    if not client or not client:supports_method(method_name) then
        return vim.notify('Clangd client not found', vim.log.levels.ERROR)
    end
    local win = vim.api.nvim_get_current_win()
    local params = vim.lsp.util.make_position_params(win, client.offset_encoding)
    ---@diagnostic disable-next-line:param-type-mismatch
    client:request(method_name, params, function(err, res)
        if err or #res == 0 then
            -- Clangd always returns an error, there is no reason to parse it
            return
        end
        local container = string.format('container: %s', res[1].containerName) ---@type string
        local name = string.format('name: %s', res[1].name) ---@type string
        vim.lsp.util.open_floating_preview({ name, container }, '', {
            height = 2,
            width = math.max(string.len(name), string.len(container)),
            focusable = false,
            focus = false,
            title = 'Symbol Info',
        })
    end, bufnr)
end

local function get_clangd_executable()
    local clangd_locations = {
        -- '/usr/local/llvm-dev/bin/clangd',
        '/usr/local/llvm/bin/clangd',
        '/usr/bin/clangd'
    }

    for _, clangd in ipairs(clangd_locations) do
        if io.open(clangd, 'r') ~= nil then
            return clangd
        end
    end


    return vim.fs.joinpath(vim.fn.stdpath("data"), "mason/bin/clangd")
end

local function get_cpu_count()
    -- Run the command using Neovim's vim.fn.system
    local result = vim.fn.system("nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 1")

    -- If something went wrong, fallback to 1
    if result == nil or result == "" then
        return "1"
    end

    -- Remove trailing newline
    result = result:gsub("\n", "")
    return result
end


---@class ClangdInitializeResult: lsp.InitializeResult
---@field offsetEncoding? string

---@type vim.lsp.Config
return {
    cmd = { get_clangd_executable(),
        "-j",
        get_cpu_count(),
        "--pch-storage=memory",
        "--malloc-trim",
        "--header-insertion=never",
        "--completion-style=bundled",
        "--clang-tidy",
        "--background-index",
        "--log=error",
    },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
    root_markers = {
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac', -- AutoTools
        '.git',
    },
    get_language_id = function(_, ftype)
        local t = { objc = 'objective-c', objcpp = 'objective-cpp', cuda = 'cuda-cpp' }
        return t[ftype] or ftype
    end,
    capabilities = {
        textDocument = {
            completion = {
                editsNearCursor = true,
            },
        },
        offsetEncoding = { 'utf-8', 'utf-16' },
    },
    ---@param init_result ClangdInitializeResult
    on_init = function(client, init_result)
        if init_result.offsetEncoding then
            client.offset_encoding = init_result.offsetEncoding
        end
    end,
    on_attach = function(client, bufnr)
        vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdSwitchSourceHeader', function()
            switch_source_header(bufnr, client)
        end, { desc = 'Switch between source/header' })

        vim.api.nvim_buf_create_user_command(bufnr, 'LspClangdShowSymbolInfo', function()
            symbol_info(bufnr, client)
        end, { desc = 'Show symbol info' })
    end,
}
