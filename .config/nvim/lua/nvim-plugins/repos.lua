vim.pack.add({
    "https://github.com/to268/repos.nvim",
})

local repos = require('repos')
local opt = vim.opt_local
local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local map = vim.keymap.set
local group_opts = { clear = true }
local map_opts = { noremap = true, silent = true }

repos.setup({
    callbacks = {
        ["llvm-project"] = function(root)
            local augroup = autogroup("llvm-project", group_opts)

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

            -- LLVM LIT cfg
            autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
                group = augroup,
                pattern = "lit.*cfg",
                command = [[set ft=python]]
            })

            -- LLVM IR
            autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
                group = augroup,
                pattern = "*.ll",
                command = [[set ft=llvm]]
            })

            -- LLVM MLIR
            autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
                group = augroup,
                pattern = "*.mlir",
                command = [[set ft=mlir]]
            })

            -- LLVM MIR
            autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
                group = augroup,
                pattern = "*.mir",
                command = [[set ft=mir]]
            })

            -- LLVM TableGen
            autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
                group = augroup,
                pattern = "*.td",
                command = [[set ft=tablegen]]
            })

            -- Source files
            autocmd("FileType", {
                group = augroup,
                pattern = {"*.c", "*.cpp"},
                callback = function()
                    opt.cindent = true
                end,
            })

            -- LLVM IR comments
            autocmd("FileType", {
                group = augroup,
                pattern = "*.ll",
                callback = function()
                    opt.comments:append(":;")
                    opt.commentstring = "; %s"
                end,
            })

            -- TableGen pairs
            autocmd("FileType", {
                group = augroup,
                pattern = "*.td",
                callback = function()
                    opt.matchpairs:append("<:>")
                end,
            })

            map(
                "n",
                "<leader>lit",
                ":!" .. vim.fs.joinpath(root, "build/bin/llvm-lit") .. "-v %<CR>",
                map_opts
            )
            map(
                {"n", "v"},
            "<leader>cf",
            ":pyf " .. vim.fs.joinpath(root, "clang/tools/clang-format/clang-format.py") .. "<CR>",
            map_opts
            )
        end,
    },
})
