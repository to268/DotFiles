if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')
" Dev stuff
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ycm-core/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'morhetz/gruvbox'

" File explorer
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Comments
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

" Utils
Plug 'aurieh/discord.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'lukesmithxyz/vimling'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'vim-utils/vim-man'
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'kovetskiy/sxhkd-vim'
call plug#end()

" Basic
    set go=a
    set mouse=a
    set clipboard+=unnamedplus
    set nocompatible
    filetype plugin on
    syntax on
    set encoding=utf-8
    set number relativenumber
    set updatetime=300
    set signcolumn=yes
    set smarttab
    set smartindent
    set expandtab
    set hidden
    set nowrap
    set smartcase
    set undofile
    set incsearch
    set noerrorbells
    set nohlsearch
    set tabstop=4 softtabstop=4
    set shiftwidth=4
    colorscheme gruvbox
    set background=dark
    nnoremap <F5> :edit <CR>
    let mapleader = ","

" Autocompletion
	set wildmode=longest,list,full

" Disables automatic commenting on newline
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Update Discord rich presence
"	autocmd VimEnter * DiscordUpdatePresence

" Goyo plugin
    map <leader>f :Goyo \| set bg=dark \| set linebreak<CR>

" UltiSnips
    let g:UltiSnipsExpandTrigger="<leader>s"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Vim fugitive
    nmap <leader>gj :diffget //3<CR>
    nmap <leader>gf :diffget //2<CR>
    nmap <leader>gl :GlLog<CR>
    nmap <leader>gs :G<CR>
    nmap <leader>gc :Gcommit<CR>
    nmap <leader>gps :Gpush<CR>
    nmap <leader>gpl :Gpull<CR>
" YouCompleteMe
    fun! YCM()
        nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
        nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
        nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename
        let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
        let g:ycm_key_detailed_diagnostics = '<F1>d'
        let g:ycm_filepath_completion_use_working_dir = 1
        let g:ycm_auto_start_csharp_server = 1
        let g:ycm_auto_stop_csharp_server = 1
        let g:ycm_complete_in_strings = 1
        let g:ycm_show_diagnostics_ui = 1
    endfun
    let g:ycm_global_ycm_extra_conf = '~/.config/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py'

" Spell check
	map <leader>o :setlocal spell! spelllang=en_us<CR>
    map <leader>p :setlocal spell! spelllang=fr_fr<CR>

" Splits open at the bottom and right
	set splitbelow splitright

" vimling
	nm <leader>d :call ToggleDeadKeys()<CR>
	imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader>i :call ToggleIPA()<CR>
	imap <leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader>q :call ToggleProse()<CR>

" shortcuts
    map <leader>dd yyp

" Nerd Config
	let g:NERDTreeGitStatusWithFlags = 1
	let NERDTreeShowHidden=1
    map <C-n> :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcutting split navigation, saving a keypress
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo for neomutt
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width = 80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=dark
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>
    autocmd BufRead,BufNewFile /tmp/neomutt* let g:loaded_youcompleteme = 1

" Automatically deletes all trailing whitespace on save
	autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * %s/\n\+\%$//e

" Load YCM Completer based on file type
    autocmd FileType c,h,cpp,cxx,hpp,sh,json,xml,yml,yaml,vim : call YCM()

" Automations
" Update Xresources
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update sxhkdrc
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
