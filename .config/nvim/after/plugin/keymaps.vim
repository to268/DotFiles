" Basic
nnoremap <silent><leader>pi :PackerInstall<CR>
nnoremap <silent><leader>ps :PackerSync<CR>
nnoremap <silent><leader>u :UndotreeShow<CR>
noremap! <C-h> <C-w>

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

" Disable ex mode
nnoremap <silent> Q <nop>

" Quickfix
nnoremap <leader>co :copen<CR>
nnoremap <leader>cp :cprev<CR>zzzv
nnoremap <leader>cn :cnext<CR>zzzv
nnoremap <leader>lo :lopen<CR>
nnoremap <leader>lp :lprev<CR>zzzv
nnoremap <leader>ln :lnext<CR>zzzv

" Lsp (clangd)
nnoremap <silent><leader>h :ClangdSwitchSourceHeader<CR>

" Spell check
map <leader>se :setlocal spell! spelllang=en_us<CR>
map <leader>sf :setlocal spell! spelllang=fr_fr<CR>

" Auto breakpoint for undo
inoremap , ,<c-g>u
inoremap ; ;<c-g>u
inoremap . .<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u

" Fix jumplist
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" Others things
nnoremap <leader>ra :%s/<C-R>=expand("<cword>")<CR>/
nnoremap <silent><F5> :edit<CR>
nnoremap <silent><leader>j :m .+1<CR>==
nnoremap <silent><leader>k :m .-2<CR>==
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
nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
