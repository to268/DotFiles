local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.pack.add({
    "https://www.github.com/stevearc/oil.nvim"
})

require("oil").setup {
    keymaps = {
        ["<C-r>"] = "actions.refresh",
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
        ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
    },
    view_options = {
        show_hidden = true,
    },
}

map("n", "<leader>n", require("oil").toggle_float, opts)
