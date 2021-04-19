" Telescope remaps
nnoremap <silent><leader>tl :Telescope<CR>
nnoremap <silent><leader>bf <cmd>lua require('telescope.builtin').buffers{}<CR>
nnoremap <silent><leader>ch <cmd>lua require('telescope.builtin').command_history{}<CR>
nnoremap <silent><leader>of <cmd>lua require('telescope.builtin').oldfiles{}<CR>
nnoremap <silent><leader>rg <cmd>lua require('telescope.builtin').live_grep{}<CR>
nnoremap <silent><leader>tr <cmd>lua require('telescope.builtin').treesitter{}<CR>
nnoremap <silent><leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <silent><leader>fg :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <silent><leader>ht :lua require('telescope.builtin').help_tags()<CR>
nnoremap <silent><leader>gb :lua require("telescope.builtin").git_branches()<CR>
nnoremap <silent><leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>
nnoremap <silent><leader>d :lua require("telescope-doc").open_path({cwd = "$HOME/files/ext/shared/pdf/"})<CR>
