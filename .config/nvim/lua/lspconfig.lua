local nvim_lsp = require("nvim_lsp")

local function launchServers()
    nvim_lsp.clangd.setup{ on_attach=require'completion'.on_attach }
    nvim_lsp.tsserver.setup{ on_attach=require'completion'.on_attach }
    nvim_lsp.pyls.setup{ on_attach=require'completion'.on_attach  }
    nvim_lsp.bashls.setup{ on_attach=require'completion'.on_attach  }
    nvim_lsp.r_language_server.setup{ on_attach=require'completion'.on_attach  }
    nvim_lsp.sumneko_lua.setup{ on_attach=require'completion'.on_attach  }
    nvim_lsp.vimls.setup{ on_attach=require'completion'.on_attach  }
end

return {
    launchServers = launchServers
}