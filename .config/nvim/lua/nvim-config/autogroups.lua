local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local opts = { clear = true }

local automations = autogroup("automations", opts)
local ft = autogroup("ft", opts)

-- Base

-- Highlight yanked text
autocmd('TextYankPost', {
    group = autogroup("highlight_yank", opts),
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

-- Automations

-- Make sure to not continue comments on o/O
vim.api.nvim_create_autocmd("FileType", {
    group = automations,
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove("o")
    end,
})

-- Remove trailing spaces and lines
autocmd("BufWritePre", {
    group = automations,
    pattern = "*",
    callback = function()
        -- Do not apply on ReleaseNotes.rst
        if vim.fn.expand('%:t') ~= "ReleaseNotes.rst" then
            require('mini.trailspace').trim()
            require('mini.trailspace').trim_last_lines()
        end
    end,
})

-- Sort packages list
autocmd("BufWritePost", {
    group = automations,
    pattern = "packages.txt",
    callback = function()
        vim.cmd [[sort]]
    end,
})

-- FileTypes

-- NASM asm
autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
    group = ft,
    pattern = "*.asm",
    command = [[set ft=nasm]]
})

-- GNU asm
autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
    group = ft,
    pattern = "*.s",
    command = [[set ft=asm]]
})

-- Vulkan
autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
    group = ft,
    pattern = {"*.vert", "*.tesc", "*.tese", "*.geom", "*.frag", "*.comp"},
    command = [[set ft=glsl]]
})

-- Makefiles
autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
    group = ft,
    pattern = "*Makefile*",
    command = [[set ft=make]]
})
