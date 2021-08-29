local cmp = require("nvim-plugin.cmp")
local lspconfig = require("lspconfig")
local lspkind = require('lspkind').init({symbol_map = {Field = '', Property = ''}})
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

local custom_attach = function(client)
    -- Enable cmp
    cmp.setup()

    -- Enable lspsaga
    require('lspsaga').init_lsp_saga()
    map("n", "<leader>vls", ":Lspsaga lsp_finder<CR>", opts)
    map("n", "<leader>va", ":Lspsaga code_action<CR>", opts)
    map("n", "<leader>vf", ":Lspsaga lsp_finder<CR>", opts)
    map("n", "<leader>vdc", ":Lspsaga hover_doc<CR>", opts)
    map("n", "<leader>vrn", ":Lspsaga rename<CR>", opts)
    map("n", "<leader>vpd", ":Lspsaga preview_definition<CR>", opts)

    map('n', '<leader>val', '<cmd>SymbolsOutline<CR>', opts)
    -- Jump forwards/backwards
    map('n', '<leader>vdp', '<cmd>AerialPrev<CR>', opts)
    map('n', '<leader>vdn', '<cmd>AerialNext<CR>', opts)
end

lspconfig.bashls.setup{ on_attach=custom_attach }
lspconfig.clangd.setup{ on_attach=custom_attach, lspkind }
lspconfig.jsonls.setup{ on_attach=custom_attach }
lspconfig.pylsp.setup{ on_attach=custom_attach, lspkind }
lspconfig.r_language_server.setup{ on_attach=custom_attach }
lspconfig.rust_analyzer.setup{ on_attach=custom_attach, lspkind }

local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/Linux/lua-language-server"
require'lspconfig'.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
    on_attach=custom_attach,

}

lspconfig.texlab.setup{
    settings = {
        latex = {
            build = {
                executable = "tex",
                args = {"-pdf", "%f" },
                onSave = true
            },
            lint = {
                onChange = true
            }
        }
    },
    on_attach=custom_attach
}

lspconfig.tsserver.setup{ on_attach=custom_attach, lspkind }
lspconfig.vimls.setup{ on_attach=custom_attach }

require'nvim-treesitter.configs'.setup {
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    indent = {
        enable = true
    },
    textobjects = { enable = true },
}

-- Remaps
map("n", "<leader>vds", ":lua require('telescope.builtin').lsp_document_symbols{}<CR>", opts)
map("n", "<leader>vws", ":lua require('telescope.builtin').lsp_workspace_symbols{}<CR>", opts)
map("n", "<leader>vi", ":lua vim.lsp.buf.implementations()<CR>", opts)
map("n", "<leader>vd", ":lua vim.lsp.buf.definition()<CR>", opts)
map("n", "<leader>vh", ":lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<leader>vs", ":lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "<leader>vt", ":lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "<leader>vr", ":lua vim.lsp.buf.references()<CR>", opts)
map("n", "<leader>vl", "<cmd>LspTroubleToggle<CR>", opts)
