" Telescope remaps
nnoremap <silent><leader>bf <cmd>lua require('telescope.builtin').buffers{}<CR>
nnoremap <silent><leader>ch <cmd>lua require('telescope.builtin').command_history{}<CR>
nnoremap <silent><leader>of <cmd>lua require('telescope.builtin').oldfiles{}<CR>
nnoremap <silent><leader>rg <cmd>lua require('telescope.builtin').live_grep{}<CR>
nnoremap <silent><leader>tr <cmd>lua require('telescope.builtin').treesitter{}<CR>
nnoremap <silent><leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <silent><leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <silent><leader>ht :lua require('telescope.builtin').help_tags()<CR>
