local repos = require('repos')
local opt = vim.opt
local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local map = vim.api.nvim_set_keymap
local group_opts = { clear = true }
local map_opts = { noremap = true, silent = true }

repos.setup({
    callbacks = {
        ["git@github.com:llvm/llvm-project"] = function(root)
            local augroup = autogroup("llvm", group_opts)

            autocmd("FileType", {
                group = augroup,
                pattern = "*",
                callback = function()
                    opt.tabstop = 2
                    opt.softtabstop = 2
                    opt.shiftwidth = 2
                    opt.expandtab = true
                    opt.smarttab = true
                    opt.cinoptions = ":0,g0,(0,Ws,l1"
                    opt.cindent = false
                    opt.smartindent = true
                end,
            })

            autocmd("FileType", {
                group = augroup,
                pattern = "make",
                callback = function()
                    opt.expandtab = false
                end,
            })

            autocmd("FileType", {
                group = augroup,
                pattern = {"*.c", "*.cpp"},
                callback = function()
                    opt.cindent = true
                end,
            })

            map(
                "n",
                "<leader>lit",
                ":!" .. root .. "/build/bin/llvm-lit -v %<CR>",
                map_opts
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
