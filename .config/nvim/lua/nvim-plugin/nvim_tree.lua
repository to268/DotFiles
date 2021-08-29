local map = vim.api.nvim_set_keymap

vim.g.nvim_tree_side = 'left'
vim.g.nvim_tree_width = 40
vim.g.nvim_tree_ignore = { 'node_modules', '.cache' }
vim.g.nvim_tree_auto_open = 0
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_auto_ignore_ft = { 'startify' }
vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_hide_dotfiles = 0
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_tab_open = 0
vim.g.nvim_tree_width_allow_resize  = 1
vim.g.nvim_tree_disable_netrw = 1

map("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
map("n", "<leader>ntr", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
map("n", "<leader>ntf", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
