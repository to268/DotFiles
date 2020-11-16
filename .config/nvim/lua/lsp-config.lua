local lspconfig = require("lspconfig")

local function launchServers()
    lspconfig.bashls.setup{ on_attach=require'completion'.on_attach  }
    lspconfig.clangd.setup{ on_attach=require'completion'.on_attach }
    lspconfig.cssls.setup{ on_attach=require'completion'.on_attach }
    lspconfig.jsonls.setup{ on_attach=require'completion'.on_attach }
    lspconfig.pyls.setup{ on_attach=require'completion'.on_attach  }
    lspconfig.r_language_server.setup{ on_attach=require'completion'.on_attach  }
    lspconfig.rust_analyzer.setup{ on_attach=require'completion'.on_attach  }
    lspconfig.sumneko_lua.setup{ on_attach=require'completion'.on_attach  }
    lspconfig.texlab.setup{ on_attach=require'completion'.on_attach  }
    lspconfig.tsserver.setup{ on_attach=require'completion'.on_attach }
    lspconfig.vimls.setup{ on_attach=require'completion'.on_attach  }
end

return {
    launchServers = launchServers
}
