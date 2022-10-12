local repos = require('repos')

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
