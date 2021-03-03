" Shortcutting split navigation
nnoremap <silent><C-h> :wincmd h<CR>
nnoremap <silent><C-j> :wincmd j<CR>
nnoremap <silent><C-k> :wincmd k<CR>
nnoremap <silent><C-l> :wincmd l<CR>
nnoremap <silent><C-q> :quit<CR>

" Resizing
nnoremap <silent><leader>r= <C-w>=
nnoremap <silent><leader>rj :resize 15<CR>
nnoremap <silent><leader>rk :resize 100<CR>
nnoremap <silent><leader>r+ :resize +5<CR>
nnoremap <silent><leader>r- :resize -5<CR>
nnoremap <silent><leader>+ :vertical resize +5<CR>
nnoremap <silent><leader>- :vertical resize -5<CR>

" Terminals
nnoremap <silent><leader>ts :split term://zsh<CR>
nnoremap <silent><leader>tv :vsplit term://zsh<CR>

" Ignore case for the write command
com! W w

" Use alt-w for managing buffers for the dvorak layout
map <A-w> <C-w>

" Others things
nnoremap <silent><leader><F5> :so ~/.config/nvim/init.vim<CR>
nnoremap <leader>ra :%s/<C-R>=expand("<cword>")<CR>/
nnoremap <silent><F5> :edit<CR>
nnoremap <C-k> :cnext<CR>
nnoremap <C-j> :cprev<CR>
nnoremap <leader>co :copen<CR>
vnoremap <silent>J :m '>+1<CR>gv=gv
vnoremap <silent>K :m '<-2<CR>gv=gv
vnoremap <leader>s :sort<CR>
vnoremap <leader>S :sort!<CR>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
inoremap <esc> <C-c>
vnoremap <c-p> "_dP
vnoremap <c-x> "_d
