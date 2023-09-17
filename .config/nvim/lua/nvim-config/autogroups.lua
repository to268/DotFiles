local autogroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local opts = { clear = true }

local automations = autogroup("automations", opts)
local ft = autogroup("ft", opts)

-- Java Deez Nuts
autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
    group = ft,
    pattern = "*jsp",
    command = [[set ft=java]]
})

autocmd("BufReadPost", {
    group = autogroup("colorizer", opts),
    pattern = "*",
    callback = function()
        require('colorizer').attach_to_buffer(0)
    end,
})

-- autocmd("CursorHold", {
--     group = autogroup("lsp", opts),
--     pattern = "*",
--     callback = function()
--         require('lsp_signature').signature()
--     end,
-- })

autocmd("TextYankPost", {
    group = autogroup("highlight_yank", opts),
    pattern = "*",
    callback = function()
        require('vim.highlight').on_yank({timeout = 50})
    end,
})

autocmd("FileType", {
    group = autogroup("commenting", opts),
    pattern = "*",
    command = [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]
})

-- Automations

autocmd("BufWritePre", {
    group = automations,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd("BufWritePre", {
    group = automations,
    pattern = "*",
    command = [[%s/\n\+\%$//e]],
})

autocmd("BufWritePost", {
    group = automations,
    pattern = "packages.txt",
    callback = function()
        vim.cmd [[sort]]
    end,
})

-- FileTypes

-- Asm
autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
    group = ft,
    pattern = "*.asm",
    command = [[set ft=nasm]]
})

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

-- LLVM
autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
    group = ft,
    pattern = "lit.*cfg",
    command = [[set ft=python]]
})

autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
    group = ft,
    pattern = "*.ll",
    command = [[set ft=llvm]]
})

autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
    group = ft,
    pattern = "*.mlir",
    command = [[set ft=mlir]]
})

autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
    group = ft,
    pattern = "*.td",
    command = [[set ft=tablegen]]
})

autocmd({"BufNewFile", "BufRead", "BufReadPost"}, {
    group = ft,
    pattern = "*Makefile*",
    command = [[set ft=make]]
})
