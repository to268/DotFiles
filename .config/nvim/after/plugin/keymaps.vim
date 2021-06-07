" Basic
nnoremap <silent><leader>m :Make -j6<CR>
nnoremap <silent><leader>ms :Make! -j6<CR>
nnoremap <silent><leader>mc :Make! clean<CR>
nnoremap <silent><leader>mp :Make! mrproper<CR>
nnoremap <silent><leader>pi :PackerInstall<CR>
nnoremap <silent><leader>ps :PackerSync<CR>
nnoremap <silent><leader>u :UndotreeShow<CR>

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
nnoremap <silent><leader>tt :tabnew term://zsh<CR>
nnoremap <silent><leader>tf :lua require('FTerm').open()<CR>

" Terminal navigation
tnoremap <leader><Esc> <C-\><C-n>

" Ignore case for the write command
com! W w

" Quickfix
nnoremap <leader>co :copen<CR>
nnoremap <leader>cp :cprev<CR>
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>lo :lopen<CR>
nnoremap <leader>lp :lprev<CR>
nnoremap <leader>ln :lnext<CR>

" Lsp
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
imap <silent><c-space> <Plug>(completion_trigger)

" Spell check
map <leader>se :setlocal spell! spelllang=en_us<CR>
map <leader>sf :setlocal spell! spelllang=fr_fr<CR>

" Others things
nnoremap <leader>ra :%s/<C-R>=expand("<cword>")<CR>/
nnoremap <silent><F5> :edit<CR>
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
