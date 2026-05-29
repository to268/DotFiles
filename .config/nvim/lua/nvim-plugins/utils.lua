vim.pack.add({
    "https://github.com/laytan/cloak.nvim",
    "https://github.com/numToStr/FTerm.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
})

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

require('cloak').setup({})
require('FTerm').setup({})

map(
    "n",
    "<leader>tf",
    "<CMD>lua require('FTerm').toggle()<CR>",
    opts
)

require('gitsigns').setup({})
