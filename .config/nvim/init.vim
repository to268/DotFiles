"
"   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
"   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
"   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
"   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
"   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
"   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
"
" Config Structure:
"
" init.vim:
"       used for the uncategorized part and plugins
" augroups:
"       in ./after/plugin/augroups/*.vim
" remaps:
"       in ./after/plugin/augroups/*.vim
" basic configurations:
"       in ./plugins/*.vim
" lua scripts:
"       in ./lua/*.lua

" Plugins
call plug#begin('~/.config/nvim/plugged')
" Dev stuff
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ap/vim-css-color'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-dispatch'
Plug 'sheerun/vim-polyglot'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-projectionist'

" Neovim LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Neovim Tree Sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'bryall/contextprint.nvim'

" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

" Fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

" Git
Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'

" Comments
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Colors Schemes
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'chriskempson/base16-vim'

" Status Line
Plug 'hoob3rt/lualine.nvim'

" Utils
Plug 'dbeniamine/cheat.sh-vim'
Plug 'vimwiki/vimwiki'
Plug 'vim-utils/vim-man'
Plug 'mhinz/vim-startify'
Plug 'mbbill/undotree'
Plug 'vuciv/vim-bujo'
Plug 'mhinz/vim-rfc'
call plug#end()

" Execute .nvimrc
set exrc

" Map the leader key
let mapleader = " "

" Rg
if executable('rg')
    let g:rg_derive_root='true'
endif

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-s>"

" Neovim LSP
let g:completion_enable_snippet = 'UltiSnips'
let g:completion_matching_ignore_case = 1

" Nerd Config
let g:NERDTreeGitStatusWithFlags = 1
let NERDTreeShowHidden=1
map <C-n> :NERDTreeToggle<CR>

" Bujo
let g:bujo#todo_file_path = $HOME . "/.cache/bujo"
let g:bujo#window_width = 50

" Vim.cpp
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Basic Remaps
nnoremap <silent><leader>ts :split term://zsh<CR>
nnoremap <silent><leader>tv :vsplit term://zsh<CR>
nnoremap <silent><leader>rj :resize 10<CR>
nnoremap <silent><leader>rk :resize 100<CR>
nnoremap <silent><leader>r= <C-w>=
nnoremap <silent><leader>m :Make -j6<CR>
nnoremap <silent><leader>ms :Make!<CR>
nnoremap <silent><leader>mc :Make! clean<CR>
nnoremap <silent><leader>mp :Make! mrproper<CR>
nnoremap <silent><F5> :edit<CR>
nnoremap <silent><leader>pi :PlugInstall<CR>
nnoremap <silent><leader>pu :PlugUpdate<CR>
nnoremap <leader>fw :Rg <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>fhw :h <C-R>=expand("<cword>")<CR><CR>
nnoremap <leader>ra :%s/<C-R>=expand("<cword>")<CR>/
nnoremap <silent><leader>u :UndotreeShow<CR>
nnoremap <silent><leader><F5> :so ~/.config/nvim/init.vim<CR>
nnoremap <silent><leader>+ :vertical resize +5<CR>
nnoremap <silent><leader>- :vertical resize -5<CR>
nnoremap <leader>cP :lua require("contextprint").add_statement()<CR>
nnoremap <leader>cp :lua require("contextprint").add_statement(true)<CR>
vnoremap <silent>J :m '>+1<CR>gv=gv
vnoremap <silent>K :m '<-2<CR>gv=gv
vnoremap <leader>s :sort<CR>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
inoremap <esc> <C-c>
vnoremap <c-p> "_dP
vnoremap <c-x> "_d

" Ignore case for the write command
com! W w

" Use alt-w for managing buffers for the dvorak layout
map <A-w> <C-w>
