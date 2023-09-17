local cmd = vim.cmd
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Shortcut split movement
map("n", "<C-h>", ":wincmd h<CR>", opts)
map("n", "<C-j>", ":wincmd j<CR>", opts)
map("n", "<C-k>", ":wincmd k<CR>", opts)
map("n", "<C-l>", ":wincmd l<CR>", opts)
map("n", "<C-q>", cmd.quit, opts)

-- Resize shortcuts
map("n", "<leader>r=", "<C-w>=", opts)
map("n", "<leader>r+", ":resize +5<CR>", opts)
map("n", "<leader>r-", ":resize -5<CR>", opts)
map("n", "<leader>rj", ":resize 15<CR>", opts)
map("n", "<leader>rk", ":resize 100<CR>", opts)
map("n", "<leader>+", ":vertical resize +5<CR>", opts)
map("n", "<leader>-", ":vertical resize -5<CR>", opts)

-- Terminals
map("n", "<leader>ts", ":split term://zsh<CR>", opts)
map("n", "<leader>tv", ":vsplit term://zsh<CR>", opts)
map("n", "<leader>tt", ":tabnew term://zsh<CR>", opts)

-- Tabs
map("n", "<leader>t<", ":-tabm<CR>", opts)
map("n", "<leader>t>", ":+tabm<CR>", opts)

-- Disable ex mode
map("n", "Q", "<nop>", opts)

-- Quickfix
map("n", "<leader>co", cmd.copen, opts)
map("n", "<leader>cp", ":cprev<CR>zzzv", opts)
map("n", "<leader>cn", ":cnext<CR>zzzv", opts)
map("n", "<leader>lo", cmd.lopen, opts)
map("n", "<leader>lp", ":lprev<CR>zzzv", opts)
map("n", "<leader>ln", ":lnext<CR>zzzv", opts)

-- Spell check
map("n", "<leader>se", ":setlocal spell! spelllang=en_us<CR>", opts)
map("n", "<leader>sf", ":setlocal spell! spelllang=fr_fr<CR>", opts)

-- Auto breakpoints for undo
map("i", ",", ",<C-g>u", opts)
map("i", ";", ";<C-g>u", opts)
map("i", ".", ".<C-g>u", opts)
map("i", "(", "(<C-g>u", opts)
map("i", ")", ")<C-g>u", opts)
map("i", "?", "?<C-g>u", opts)
map("i", "!", "!<C-g>u", opts)

-- Other things
map("n", "<leader><F5>", ":lua require('plenary.reload').reload_module('init.lua')<CR>", opts)
map("n", "<leader>ra", [[:%s/<C-r><C-w>/<C-r><C-w>/g<Left><Left>]], { noremap = true })
map("n", "<leader><F5>", cmd.edit, opts)
map("n", "<leader>j", ":m .+1<CR>==", opts)
map("n", "<leader>k", ":m .-2<CR>==", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map("n", "<C-->", "<C-^>", opts)
map("n", "<leader>s", ":sort<CR>", opts)
map("n", "<leader>S", ":sort!<CR>", opts)
map("n", "Y", "y$", opts)
map({"n", "v"}, "<leader>y", [["+y]], opts)
map("n", "<leader>Y", [[gg"+yG]], opts)
map({"n", "v"}, "<leader>p", [["+p]], opts)
map("x", "<leader>P", [["_dP]], opts)
map({"n", "v"}, "<leader>d", [["_d]], opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)
map("n", "J", "mzJ`z", opts)
