vim.pack.add({
    "https://github.com/laytan/cloak.nvim",
    "https://github.com/numToStr/FTerm.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
    {
        src = "https://github.com/ThePrimeagen/harpoon",
        version = "harpoon2"
    }
})

local harpoon = require("harpoon")
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

harpoon:setup()

map("n", "<leader>ha", function() harpoon:list():add() end, opts)
map("n", "<leader>hq", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)

map("n", "<C-h>", function() harpoon:list():select(1) end, opts)
map("n", "<C-t>", function() harpoon:list():select(2) end, opts)
map("n", "<C-n>", function() harpoon:list():select(3) end, opts)
map("n", "<C-s>", function() harpoon:list():select(4) end, opts)
