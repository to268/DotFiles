local autocmd = vim.api.nvim_create_autocmd

-- Enable LSPs before loading plugins to load the custom config
vim.lsp.enable({
    'astro',
    'bashls',
    'clangd',
    'lua_ls',
    'pylsp',
    'rust_analyzer',
    'tblgen_lsp_server', -- Cannot be installed automatically
    'ts_ls',
})

vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/saecki/crates.nvim",
    "https://github.com/onsails/lspkind.nvim",
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/cmp-nvim-lua",
    "https://github.com/hrsh7th/cmp-calc",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-path",
    {
        src = "https://github.com/L3MON4D3/LuaSnip",
        version = vim.version.range("2.*"),
    },
})

autocmd('PackChanged', {
    callback = function(event)
        if event.data.kind == 'update' and event.data.spec.name == 'mason.nvim' then
            vim.notify('mason.nvim updated, running MasonUpdate...', vim.log.levels.INFO)
            ---@diagnostic disable-next-line: param-type-mismatch
            local ok = pcall(vim.cmd, 'MasonUpdate')
            if ok then
                vim.notify('MasonUpdate completed successfully!', vim.log.levels.INFO)
            else
                vim.notify('MasonUpdate command not available yet, skipping', vim.log.levels.WARN)
            end
        end
    end,
})

-- Global on attach function
autocmd('LspAttach', {
    callback = function(ev)
        -- client: v.data.client_id, bufnr: ev.buf
        local map = vim.keymap.set
        local opts = {buffer = ev.buf, silent = true, remap = false}

        map("n", "<leader>vdd", ":lua require('telescope.builtin').diagnostics{}<CR>", opts)
        map("n", "<leader>vds", ":lua require('telescope.builtin').lsp_document_symbols{}<CR>", opts)
        map("n", "<leader>vws", ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols{}<CR>", opts)
        map("n", "<leader>vr", ":lua require('telescope.builtin').lsp_references{}<CR>", opts)
        map("n", "<leader>vn", ":lua vim.lsp.buf.rename()<CR>", opts)
        map("n", "<leader>va", ":lua vim.lsp.buf.code_action()<CR>", opts)
        map("n", "<leader>vi", ":lua vim.lsp.buf.implementations()<CR>", opts)
        map("n", "<leader>vd", ":lua vim.lsp.buf.definition()<CR>", opts)
        map("n", "<leader>vh", ":lua vim.lsp.buf.hover()<CR>", opts)
        map("n", "<leader>vt", ":lua vim.lsp.buf.type_definition()<CR>", opts)
        map("n", "<leader>v!", ":lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>", opts)

        -- Enable inlay hints by default
        vim.lsp.inlay_hint.enable(true)
    end
})

require("crates").setup({})
require("mason").setup({})
require('mason-tool-installer').setup({
    ensure_installed = {
        'astro-language-server',
        'bashls',
        'black',
        'clang-format',
        'clangd',
        'codelldb',
        'lua_ls',
        'prettier',
        'pylint',
        'python-lsp-server',
        'rust_analyzer',
        'stylua',
        'typescript-language-server',
    }
})

local luasnip = require("luasnip")
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Replace }

cmp.setup({
    snippet = {
      expand = function(args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'crates' },
        { name = 'path' },
        { name = 'calc' },
        { name = 'luasnip', keyword_length = 2 },
        { name = 'buffer', keyword_length = 3 },
    }),
    mapping = {
        ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                if luasnip.expandable() then
                    luasnip.expand()
                else
                    cmp.confirm({
                        select = true,
                    })
                end
            else
                fallback()
            end
        end),
        ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item(cmp_select)
            elseif luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item(cmp_select)
            elseif luasnip.locally_jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, { "i", "s" }),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp.mapping.scroll_docs(-4),
        ['<C-b>'] = cmp.mapping.scroll_docs(4),
    },
    formatting = {
        fields = { 'abbr', 'icon', 'kind', 'menu' },
        format = require("lspkind").cmp_format({
            maxwidth = {
                menu = 50, -- leading text (labelDetails)
                abbr = 50, -- actual suggestion item
            },
            ellipsis_char = '...',
            show_labelDetails = true,

            before = function (_, vim_item)
                return vim_item
            end
        })
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    }
})
