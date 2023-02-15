local cmp = require("nvim-plugin.cmp")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local lspconfig = require("lspconfig")
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

local custom_attach = function(client)
    -- Enable cmp
    cmp.setup()

    -- Enable lsp_signature
    require "lsp_signature".on_attach({
        hint_enable = false,
        hint_prefix = "💡 ",
        use_lspsaga = true,
        fix_pos = true,
        auto_close_after = 3,
    })

    -- Enable lspsaga
    require('lspsaga').setup({})
    map("n", "<leader>vls", ":Lspsaga lsp_finder<CR>", opts)
    map("n", "<leader>vf", ":Lspsaga lsp_finder<CR>", opts)
    map("n", "<leader>vdc", ":Lspsaga hover_doc<CR>", opts)
    map("n", "<leader>vrn", ":Lspsaga rename<CR>", opts)
    map("n", "<leader>vpd", ":Lspsaga preview_definition<CR>", opts)

    map('n', '<leader>val', '<cmd>SymbolsOutline<CR>', opts)
    -- Jump forwards/backwards
    map('n', '<leader>vdp', '<cmd>AerialPrev<CR>', opts)
    map('n', '<leader>vdn', '<cmd>AerialNext<CR>', opts)
end

lspconfig.asm_lsp.setup{ on_attach=custom_attach, capabilities=capabilities, filetypes={ "asm", "nasm", "gasm" }}
lspconfig.bashls.setup{ on_attach=custom_attach, capabilities=capabilities }
lspconfig.clangd.setup{ on_attach=custom_attach, capabilities=capabilities, cmd={ "clangd", "-j=12" } }
lspconfig.jsonls.setup{ on_attach=custom_attach, capabilities=capabilities }
lspconfig.pylsp.setup{ on_attach=custom_attach, capabilities=capabilities }
lspconfig.r_language_server.setup{ on_attach=custom_attach, capabilities=capabilities }
lspconfig.rust_analyzer.setup{ on_attach=custom_attach, capabilities=capabilities }
lspconfig.sqlls.setup{ on_attach=custom_attach, capabilities=capabilities }

-- LLVM LSP Servers
lspconfig.mlir_lsp_server.setup{ on_attach=custom_attach, capabilities=capabilities }
lspconfig.mlir_pdll_lsp_server.setup{ on_attach=custom_attach, capabilities=capabilities }
lspconfig.tblgen_lsp_server.setup{ on_attach=custom_attach, capabilities=capabilities }

-- Web
lspconfig.html.setup{ on_attach=custom_attach, capabilities=capabilities }
lspconfig.cssls.setup{ on_attach=custom_attach, capabilities=capabilities }

local verible_binary = vim.fn.stdpath('cache')..'/lspconfig/verible/bin/verible-verilog-ls'
lspconfig.verible.setup {
    cmd = {verible_binary};
    on_attach=custom_attach, capabilities=capabilities,
}

lspconfig.lua_ls.setup {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {'vim'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
                enable = false,
            },
        },
    },
    on_attach=custom_attach, capabilities=capabilities,
}

lspconfig.texlab.setup{
    settings = {
        latex = {
            build = {
                executable = "tex",
                args = { "-pdf", "%f" },
                onSave = true
            },
            lint = {
                onChange = true
            }
        }
    },
    on_attach=custom_attach, capabilities=capabilities,
}

lspconfig.tsserver.setup{ on_attach=custom_attach,capabilities=capabilities }
lspconfig.vimls.setup{ on_attach=custom_attach, capabilities=capabilities }

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
map("n", "<leader>vws", ":lua require('telescope.builtin').lsp_dynamic_workspace_symbols{}<CR>", opts)
map("n", "<leader>vr", ":lua require('telescope.builtin').lsp_references{}<CR>", opts)
map("n", "<leader>va", ":lua vim.lsp.buf.code_action()<CR>", opts)
map("n", "<leader>vi", ":lua vim.lsp.buf.implementations()<CR>", opts)
map("n", "<leader>vd", ":lua vim.lsp.buf.definition()<CR>", opts)
map("n", "<leader>vh", ":lua vim.lsp.buf.hover()<CR>", opts)
map("n", "<leader>vs", ":lua require('lsp_signature').signature()<CR>", opts)
map("n", "<leader>vt", ":lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "<leader>vl", "<cmd>TroubleToggle<CR>", opts)
