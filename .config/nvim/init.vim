" Download plug.vim in ~/.config/nvim/autoload link : "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" and do :PlugInstall

call plug#begin('~/.config/nvim/plugged')
" Dev stuff
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'ap/vim-css-color'
Plug 'rust-lang/rust.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tpope/vim-dispatch'
Plug 'sheerun/vim-polyglot'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'stsewd/fzf-checkout.vim'

" Comments
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Colors Schemes
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'
Plug 'ayu-theme/ayu-vim'

" Utils
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'vim-utils/vim-man'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'aurieh/discord.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'mbbill/undotree'
Plug 'vuciv/vim-bujo'
call plug#end()

" Basic
syntax on
filetype plugin indent on
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
set shortmess+=c
set termguicolors
let mapleader = " "

" Autocompletion
set completeopt=menuone,noinsert,noselect
set wildmode=longest,list,full

" OneDark
func! SetOneDark()
    colorscheme onedark
	execute 'AirlineTheme onedark'
endfun

" Gruvbox
func! SetGruvbox()
    let g:gruvbox_constrast_dark = 'hard'
    let g:gruvbox_invert_selection = '0'
    colorscheme gruvbox
    set background=dark
	execute 'AirlineTheme base16_gruvbox_dark_hard'
endfun

" Initialize Gruvbox Color Scheme
colorscheme gruvbox
set background=dark

augroup gruvbox
    autocmd!
    autocmd VimEnter * call SetGruvbox()
augroup END

" Rg
if executable('rg')
    let g:rg_derive_root='true'
endif

" Fzf
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'

" Fzf checkout
let g:fzf_branch_actions = {
      \ 'checkout': {
      \   'prompt': 'Checkout> ',
      \   'execute': 'echo system("{git} checkout {branch}")',
      \   'multiple': v:false,
      \   'keymap': 'enter',
      \   'required': ['branch'],
      \   'confirm': v:false,
      \ },
      \}

" Telescope
let g:telescope_cache_results = 1
let g:telescope_prime_fuzzy_find = 1

" Set the fuzzy finder to use if we are in a git repo or not
fun! SetFuzzy()
    let l:gitcmd = system("git rev-parse --git-dir 2> /dev/null")
    if (l:gitcmd == '')
        nnoremap <C-p> <cmd>lua require'telescope.builtin'.find_files{}<CR>
        return
    endif
    nnoremap <C-p> <cmd>lua require'telescope.builtin'.git_files{}<CR>
endfun
call SetFuzzy()

" Splits open at the bottom and right
set splitbelow splitright

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-s>"

" Bujo
nmap <silent><leader>td :Todo<CR>
nmap <leader>tc <Plug>BujoChecknormal
nmap <leader>ta <Plug>BujoAddnormal
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"
let g:bujo#window_width = 50

" Shortcuts
nnoremap <silent><leader>ts :split term://zsh<CR>
nnoremap <silent><leader>tv :vsplit term://zsh<CR>
nnoremap <silent><leader>rj :resize 10<CR>
nnoremap <silent><leader>rk :resize 100<CR>
nnoremap <silent><leader>r= <C-w>=
nnoremap <silent><leader>m :Make<CR>
nnoremap <silent><leader>ms :Make!<CR>
nnoremap <silent><leader>mp :Make! mrproper<CR>
nnoremap <silent><F5> :edit<CR>
nnoremap <silent><leader>pi :PlugInstall<CR>
nnoremap <silent><leader>pu :PlugUpdate<CR>
nnoremap <silent><leader>gv :call SetGruvbox()<CR>
nnoremap <silent><leader>od :call SetOneDark()<CR>
nnoremap <silent><leader>rp :DiscordUpdatePresence<CR>
nnoremap <leader>fw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fhw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ra :%s/<C-R>=expand("<cword>")<CR>/
nnoremap <silent><leader>u :UndotreeShow<CR>
nnoremap <silent><leader>bf <cmd>lua require'telescope.builtin'.buffers{}<CR>
nnoremap <silent><leader>ch <cmd>lua require'telescope.builtin'.command_history{}<CR>
nnoremap <silent><leader>of <cmd>lua require'telescope.builtin'.oldfiles{}<CR>
nnoremap <silent><leader>rg <cmd>lua require'telescope.builtin'.live_grep{}<CR>
nnoremap <silent><leader>tr <cmd>lua require'telescope.builtin'.treesitter{}<CR>
nnoremap <silent><leader><F5> :so ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>+ :vertical resize +5<CR>
nnoremap <silent><leader>- :vertical resize -5<CR>
vnoremap <silent>J :m '>+1<CR>gv=gv
vnoremap <silent>K :m '<-2<CR>gv=gv
inoremap <esc> <C-c>
vnoremap <c-p> "_dP
vnoremap X "_d

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

" Nvim lsp
lua require("lspconfig").launchServers()
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <silent><c-space> <Plug>(completion_trigger)
nnoremap <silent><leader>vds <cmd>lua require'telescope.builtin'.lsp_document_symbols{}<CR>
nnoremap <silent><leader>vws <cmd>lua require'telescope.builtin'.lsp_workspace_symbols{}<CR>
nnoremap <silent><leader>vd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>vh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent><leader>vs <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent><leader>vt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent><leader>vr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><leader>vf <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent><leader>va <cmd>lua vim.lsp.buf.code_action()<CR>

let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_ignore_case = 1

augroup lsp
    autocmd!
    autocmd BufEnter * let g:completion_trigger_character = ['.']
    autocmd BufEnter *.r let g:completion_trigger_character = ['.', '@']
    autocmd BufEnter *.java let g:completion_trigger_character = ['.', '@']
    autocmd BufEnter *.rb let g:completion_trigger_character = ['.', '::', '@']
    autocmd BufEnter *.c,*.cpp,*.h,*.hpp let g:completion_trigger_character = ['.', '->', '::', '#']
augroup END

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

augroup NERDTree
	autocmd!
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" Disables automatic commenting on newline
augroup commenting
	autocmd!
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

com! W w

augroup neomutt
	autocmd!
	autocmd BufRead,BufNewFile /tmp/neomutt* call Neomutt()
augroup END

" Automatically deletes all trailing whitespace on save
augroup cleanFile
	autocmd!
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritePre * %s/\n\+\%$//e
augroup END

" Automations
augroup automations
	autocmd!
	" Update Xresources
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
	" Update sxhkdrc
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
augroup END
