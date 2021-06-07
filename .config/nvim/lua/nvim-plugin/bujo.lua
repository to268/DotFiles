local map = vim.api.nvim_set_keymap

vim.g["bujo#todo_file_path"] = os.getenv("HOME") .. "/.cache/bujo"
vim.g["bujo#window_width"] = 50

map("n", "<leader>td", ":Todo<CR>", { noremap = true })
map("n", "<leader>tc", "<Plug>BujoChecknormal<CR>", { noremap = true })
map("n", "<leader>ta", "<Plug>BujoAddnormal<CR>", { noremap = true })
