-- local repos = require('repos')
local repos = require('nvim-plugin.repos_plugin')

repos.setup({
    callbacks = {
        ["git@github.com:llvm/llvm-project"] = function(root)
            -- print("LLVM project at: " .. root)
        end,
        ["to268/"] = function(root)
            -- print("personal project at: " .. root)
        end,
        ["git@"] = function(root)
            -- print("git project at: " .. root)
        end,
    },
})
