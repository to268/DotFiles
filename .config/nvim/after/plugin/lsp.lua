local lsp_zero = require('lsp-zero')
local cmp = require('cmp')
local map = vim.keymap.set
local cmp_select = { behavior = cmp.SelectBehavior.Replace }
local cmp_action = require('lsp-zero').cmp_action()
local rust_tools = require('rust-tools')

require('mason-lspconfig').setup({
    ensure_installed = {
        'bashls',
        'clangd',
        'lua_ls',
        'rust_analyzer',
    },
    handlers = {
        lsp_zero.default_setup,
        clangd = lsp_zero.noop,
        rust_analyzer = lsp_zero.noop
    },
})

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'calc' },
        { name = 'crates' },
        { name = 'spell' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer',  keyword_length = 3 },
        { name = 'luasnip', keyword_length = 2 },
    },
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    },
    -- FIXME: This is not working as it should
    formatting = {
        fields = {'abbr', 'kind', 'menu'},
        format = require('lspkind').cmp_format({
            mode = 'symbol_text',
            preset = 'codicons',
            maxwidth = 50,
            ellipsis_char = '...',
        })
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    }
})

lsp_zero.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, silent = true, remap = false}

    map("n", "<leader>vds", ":lua require('telescope.builtin').lsp_document_symbols{}<CR>", opts)
    map("n", "<leader>vws", ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols{}<CR>", opts)
    map("n", "<leader>vr", ":lua require('telescope.builtin').lsp_references{}<CR>", opts)
    map("n", "<leader>vn", ":lua vim.lsp.buf.rename()<CR>", opts)
    map("n", "<leader>va", ":lua vim.lsp.buf.code_action()<CR>", opts)
    map("n", "<leader>vi", ":lua vim.lsp.buf.implementations()<CR>", opts)
    map("n", "<leader>vd", ":lua vim.lsp.buf.definition()<CR>", opts)
    map("n", "<leader>vh", ":lua vim.lsp.buf.hover()<CR>", opts)
    map("n", "<leader>vt", ":lua vim.lsp.buf.type_definition()<CR>", opts)
    -- map("n", "<leader>vl", "<cmd>TroubleToggle<CR>", opts)

    -- vim.keymap.set({'n', 'x'}, 'gq', function()
    --     vim.lsp.buf.format({
    --       async = false,
    --       timeout_ms = 10000,
    --       filter = allow_format({'lua_ls', 'rust_analyzer'})
    --     })
    -- end, opts)

    require("lsp_signature").on_attach({
        hint_enable = false,
        hint_prefix = " ",
        bind = true,
        handler_opts = {
            border = "rounded"
        }
    }, bufnr)

  lsp_zero.default_keymaps({buffer = bufnr})
end)

lsp_zero.setup()

rust_tools.setup({
    server = {
        on_attach = function(_, bufnr)
            local opts = {buffer = bufnr, silent = true, remap = false}

            map('n', '<leader>rr', rust_tools.runnables.runnables, opts)
            map('n', '<leader>rm', rust_tools.expand_macro.expand_macro, opts)
        end,
        settings = {
            ["rust-analyzer"] = {
                cargo = {
                    allFeatures = true,
                }
            }
        }
    }
})

local function get_clang_executable()
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

    return stdpath('data') .. '/mason/bin/clangd'
end

local function get_cpu_count()
    local handle = io.popen("nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 1")

    if handle == nil then
        return "1"
    end

    local result = handle:read("*a")

    if result == nil then
        return "1"
    end

    handle:close()
    return string.gsub(result, "\n", "")
end

require('lspconfig').clangd.setup({
    cmd = { get_clang_executable(),
        "-j",
        get_cpu_count(),
        "--pch-storage=memory",
        "--malloc-trim",
        "--header-insertion=never",
        "--completion-style=bundled",
        "--clang-tidy",
        "--background-index",
    },
    on_attach = function(_, bufnr)
        local opts = {buffer = bufnr, silent = true, remap = false}

        require("clangd_extensions").setup({
            ast = {
                role_icons = {
                    type = "",
                    declaration = "",
                    expression = "",
                    specifier = "",
                    statement = "",
                    ["template argument"] = "",
                },

                kind_icons = {
                    Compound = "",
                    Recovery = "",
                    TranslationUnit = "",
                    PackExpansion = "",
                    TemplateTypeParm = "",
                    TemplateTemplateParm = "",
                    TemplateParamObject = "",
                }
            },
            memory_usage = {
                border = "single",
            },
            symbol_info = {
                border = "single",
            },
        })
        require("clangd_extensions.inlay_hints").setup_autocmd()
        require("clangd_extensions.inlay_hints").set_inlay_hints()

        map("n", "<leader>h", ":ClangdSwitchSourceHeader<CR>", opts)
        map({"n", "v"}, "<leader>cf", ":pyf ~/files/Dev/llvm-project/main/clang/tools/clang-format/clang-format.py<CR>", opts)
        map({"n", "v"}, "<leader>ca", ":ClangdAST<CR>", opts)
        map({"n", "v"}, "<leader>cm", ":ClangdMemoryUsage<CR>", opts)
        map({"n", "v"}, "<leader>cs", ":ClangdSymbolInfo<CR>", opts)
        map({"n", "v"}, "<leader>ct", ":ClangdTypeHierarchy<CR>", opts)
    end
})
