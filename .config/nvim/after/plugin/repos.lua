local repos = require('repos')
local opt = vim.opt

repos.setup({
    callbacks = {
        ["git@github.com:llvm/llvm-project"] = function(root)
            opt.tabstop = 2
            opt.softtabstop = 2
            opt.shiftwidth = 2
            opt.expandtab = true
            opt.smarttab = true
            opt.cinoptions = ":0,g0,(0,Ws,l1"

            local augroup = vim.api.nvim_create_augroup("llvm", { clear = true })

            vim.api.nvim_create_autocmd("FileType", {
                group = augroup,
                pattern = "*",
                callback = function()
                    opt.cindent = false
                    opt.smartindent = true
                end,
            })

            vim.api.nvim_create_autocmd("FileType", {
                group = augroup,
                pattern = "make",
                callback = function()
                    opt.expandtab = false
                end,
            })

            vim.api.nvim_create_autocmd("FileType", {
                group = augroup,
                pattern = {"*.c", "*.cpp"},
                callback = function()
                    opt.cindent = true
                end,
            })

            vim.api.nvim_set_keymap(
                "n",
                "<leader>lit",
                ":!" .. root .. "/build/bin/llvm-lit -v %<CR>",
                { noremap = true, silent = true }
            )
        end,
        ["to268/"] = function(root)
            -- print("personal project at: " .. root)
        end,
        ["git@"] = function(root)
            -- print("git project at: " .. root)
        end,
    },
})
