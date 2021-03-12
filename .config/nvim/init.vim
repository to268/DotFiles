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
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'tpope/vim-projectionist'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'jbyuki/monolithic.nvim'

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

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

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
Plug 'rmagatti/auto-session'
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

" Vim.cpp
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Auto-sessions
let g:auto_session_pre_save_cmds = ["tabdo NvimTreeClose"]
nnoremap <silent><leader>ss :SaveSession<CR>
nnoremap <silent><leader>rs :RestoreSession<CR>

" Monolithic
nnoremap <leader>ea :lua require"monolithic".open()<CR>

" Context Print
nnoremap <leader>cP :lua require("contextprint").add_statement()<CR>
nnoremap <leader>cp :lua require("contextprint").add_statement(true)<CR>

" Basic Remaps
nnoremap <silent><leader>m :Make -j6<CR>
nnoremap <silent><leader>ms :Make!<CR>
nnoremap <silent><leader>mc :Make! clean<CR>
nnoremap <silent><leader>mp :Make! mrproper<CR>
nnoremap <silent><leader>pi :PlugInstall<CR>
nnoremap <silent><leader>pu :PlugUpdate<CR>
nnoremap <silent><leader>u :UndotreeShow<CR>
