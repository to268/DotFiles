if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/ silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
" Dev stuff
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-dispatch'
Plug 'sheerun/vim-polyglot'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'

" Comments
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Utils
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mbbill/undotree'
Plug 'kovetskiy/sxhkd-vim'
Plug 'vuciv/vim-bujo'
Plug 'ThePrimeagen/vim-apm', {'branch': 'timings'}
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
call plug#end()

" Basic
syntax on
filetype plugin on
set clipboard+=unnamedplus
set nocompatible
set encoding=utf-8
set relativenumber
set nu
set signcolumn=yes
set smarttab
set smartindent
set expandtab
set hidden
set nowrap
set noshowmode
set smartcase
set undodir=~/.cache/undodir
set undofile
set incsearch
set noerrorbells
set nohlsearch
set nobackup
set tabstop=4 softtabstop=4
set shiftwidth=4
set scrolloff=6
set updatetime=50
set timeoutlen=250
set shortmess+=c
let mapleader = " "

" Vim Apm
autocmd VimEnter * VimApm
autocmd VimLeavePre * VimApmShutdown
cnoremap apm VimApm

" Vim Be Good
let g:vim_be_good_floating = 0
let g:vim_be_good_delete_me_random_offset = 5

" Autocompletion
set wildmode=longest,list,full

" Gruvbox
let g:gruvbox_constrast_dark = 'hard'
let g:gruvbox_invert_selection = '0'
colorscheme gruvbox
set background=dark

" Rg
if executable('rg')
    let g:rg_derive_root='true'
endif

" Vim-airline
let g:airline_theme = "angr"

" Fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Fzf checkout
let g:fzf_checkout_track_key = 'ctrl-t'

" Set the fuzzy finder to use if we are in a git repo or not
fun! SetFuzzy()
    let l:gitcmd = system("git rev-parse --git-dir 2> /dev/null")
    if (l:gitcmd == '')
        nmap <C-p> :Files<CR>
        return
    endif
    nmap <C-p> :GFiles<CR>
endfun
call SetFuzzy()

" Splits open at the bottom and right
set splitbelow splitright

" Goyo plugin
map <silent><leader>go :Goyo \| set bg=dark \| set linebreak<CR>

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-s>"

" Bujo
nmap <silent><leader>t :Todo<CR>
nmap <leader>tc <Plug>BujoChecknormal
nmap <leader>ta <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"
let g:bujo#window_width = 50

" shortcuts
nmap <leader>d yyp
nnoremap <silent><leader>m :Make<CR>
nnoremap <silent><leader>ms :Make!<CR>
nnoremap <silent><leader>mp :Make! mrproper<CR>
nnoremap <silent><F5> :edit<CR>
nnoremap <silent><leader>pi :PlugInstall<CR>
nnoremap <silent><leader>pu :PlugUpdate<CR>
inoremap <C-c> <esc>
nnoremap <leader>fw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fhw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fo :CocSearch <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ra :%s/<C-R>=expand("<cword>")<CR>/
nnoremap <silent><leader>u :UndotreeShow<CR>
nnoremap <silent><Leader>rg :Rg<SPACE>
nnoremap <silent><Leader><F5> :so ~/.config/nvim/init.vim<CR>
nnoremap <silent><Leader>+ :vertical resize +5<CR>
nnoremap <silent><Leader>- :vertical resize -5<CR>
vnoremap <silent>J :m '>+1<CR>gv=gv
vnoremap <silent>K :m '<-2<CR>gv=gv

" Vim fugitive
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gl :GlLog<CR>
nmap <leader>gs :G<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gch :GCheckout<CR>
nmap <leader>gps :Gpush<CR>
nmap <leader>gpl :Gpull<CR>
nmap <leader>gt :GCheckoutTag<CR>

" Coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent><leader>gd <Plug>(coc-definition)
nmap <silent><leader>gy <Plug>(coc-type-definition)
nmap <silent><leader>gi <Plug>(coc-implementation)
nmap <silent><leader>gr <Plug>(coc-references)
nmap <silent><leader>rr <Plug>(coc-rename)
nmap <silent><leader>g( <Plug>(coc-diagnostic-prev)
nmap <silent><leader>g) <Plug>(coc-diagnostic-next)
nmap <silent><leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent><leader>gn <Plug>(coc-diagnostic-next-error)
nmap <silent><leader>fx <Plug>(coc-fix-current)
nnoremap <silent><leader>dc :call <SID>show_documentation()<CR>
inoremap <silent><expr> <leader>c coc#refresh()
nnoremap <silent><leader>cr :CocRestart
inoremap <silent><expr> <leader>j pumvisible() ? coc#_select_confirm() : ""

autocmd CursorHold * silent call CocActionAsync('highlight')
let g:airline#extensions#coc#enabled = 0

" Spell check
map <leader>o :setlocal spell! spelllang=en_us<CR>
map <leader>p :setlocal spell! spelllang=fr_fr<CR>

" Shortcutting split navigation
nnoremap <silent><C-h> :wincmd h<CR>
nnoremap <silent><C-j> :wincmd j<CR>
nnoremap <silent><C-k> :wincmd k<CR>
nnoremap <silent><C-l> :wincmd l<CR>
nnoremap <silent><C-q> :quit<CR>

" Nerd Config
let g:NERDTreeGitStatusWithFlags = 1
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo for neomutt
fun! Neomutt()
    let g:goyo_width = 80
    silent :Goyo | set bg=dark
    map <leader>z :Goyo\|x!<CR>
    map <leader>q :Goyo\|q!<CR>
    let b:coc_enabled = 0
endfunction
autocmd BufRead,BufNewFile /tmp/neomutt* call Neomutt()

" Automatically deletes all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

" Automations
" Update Xresources
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update sxhkdrc
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
