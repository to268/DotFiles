local map = vim.api.nvim_set_keymap

require('nvim-tree').setup {
    disable_netrw       = true,
    hijack_netrw        = false,
    open_on_tab         = false,
    hijack_cursor       = true,
    update_cwd          = false,
}

map("n", "<C-n>", ":lua require('nvim-tree').toggle()<CR>", { noremap = true, silent = true })
