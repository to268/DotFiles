local lspconfig = require("lspconfig")
local on_attach = require("completion").on_attach
local lspkind = require('lspkind').init({symbol_map = {Enum = ''}})
local map = vim.api.nvim_set_keymap

lspconfig.bashls.setup{ on_attach=on_attach, lspkind }
lspconfig.clangd.setup{ on_attach=on_attach, lspkind }
lspconfig.jsonls.setup{ on_attach=on_attach }
lspconfig.pyls.setup{ on_attach=on_attach, lspkind, }
lspconfig.r_language_server.setup{ on_attach=on_attach, lspkind }
lspconfig.rust_analyzer.setup{ on_attach=on_attach, lspkind }

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
    on_attach=on_attach,
    lspkind
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
    on_attach=on_attach
}

lspconfig.tsserver.setup{ on_attach=on_attach, lspkind }
lspconfig.vimls.setup{ on_attach=on_attach, lspkind }

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
}

vim.g.completion_enable_snippet = 'UltiSnips'
vim.g.completion_matching_ignore_case = 1

local opts = { noremap = true, silent = true }

-- Remaps
map("n", "<leader>vds", ":lua require('telescope.builtin').lsp_document_symbols{}<CR>", opts)
map("n", "<leader>vws", ":lua require('telescope.builtin').lsp_workspace_symbols{}<CR>", opts)
map("n", "<leader>vrn", ":lua vim.lsp.buf.rename()<CR>", opts)
map("n", "<leader>vi", ":lua vim.lsp.buf.implementations()<CR>", opts)
map("n", "<leader>vd", ":lua vim.lsp.buf.definition()<CR>", opts)
map("n", "<leader>vh", ":lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<leader>vs", ":lua vim.lsp.buf.signature_help()<CR>", opts)
map("n", "<leader>vt", ":lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "<leader>vr", ":lua vim.lsp.buf.references()<CR>", opts)
map("n", "<leader>vf", ":lua vim.lsp.buf.workspace_symbol()<CR>", opts)
map("n", "<leader>va", ":lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "<leader>vl", "<cmd>LspTroubleToggle<CR>", opts)
