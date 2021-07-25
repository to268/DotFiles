local map = vim.api.nvim_set_keymap

map("n", "<leader>ga", ":Git add .<CR>", { noremap = true })
map("n", "<leader>gc", ":Git commit<CR>", { noremap = true })
map("n", "<leader>gch", ":GBranches<CR>", { noremap = true })
map("n", "<leader>gd", ":Gdiffsplit<CR>", { noremap = true })
map("n", "<leader>gf", ":Git fetch --all<CR>", { noremap = true })
map("n", "<leader>gh", ":diffget //3<CR>", { noremap = true })
map("n", "<leader>gl", ":GlLog<CR>", { noremap = true })
map("n", "<leader>gpl", ":Git pull<CR>", { noremap = true })
map("n", "<leader>gps", ":Git push<CR>", { noremap = true })
map("n", "<leader>gs", ":G<CR>", { noremap = true })
map("n", "<leader>gt", ":GTags<CR>", { noremap = true })
map("n", "<leader>gu", ":diffget //2<CR>", { noremap = true })
