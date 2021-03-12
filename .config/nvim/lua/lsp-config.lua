local lspconfig = require("lspconfig")
local on_attach = require'completion'.on_attach

local function launchServers()
    lspconfig.bashls.setup{ on_attach=on_attach  }
    lspconfig.clangd.setup{ on_attach=on_attach }
    lspconfig.jsonls.setup{ on_attach=on_attach }
    lspconfig.pyls.setup{ on_attach=on_attach  }
    lspconfig.r_language_server.setup{ on_attach=on_attach  }
    lspconfig.rust_analyzer.setup{ on_attach=on_attach  }

    local lua_base_dir = "/usr/share/lua-language-server/"
    lspconfig.sumneko_lua.setup{
        cmd = {lua_base_dir.."bin/Linux/lua-language-server", "-E", lua_base_dir.."main.lua"};
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
    }

    lspconfig.tsserver.setup{ on_attach=on_attach }
    lspconfig.vimls.setup{ on_attach=on_attach  }
end

return {
    launchServers = launchServers
}
