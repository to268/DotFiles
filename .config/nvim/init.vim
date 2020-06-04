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
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'morhetz/gruvbox'

" file explorer
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
Plug 'bling/vim-airline'
Plug 'vim-utils/vim-man'
Plug 'kien/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'kovetskiy/sxhkd-vim'
call plug#end()

" Basic
    set go=a
    set mouse=a
    set clipboard=unnamed
    nnoremap c "_c
    set nocompatible
    filetype plugin on
    syntax on
    set encoding=utf-8
    set relativenumber
    set updatetime=300
    set signcolumn=yes
    set shortmess+=c
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

" autocompletion:
	set wildmode=longest,list,full
" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Update Discord rich presence
	autocmd VimEnter * DiscordUpdatePresence

" Goyo plugin:
map ,f :Goyo \| set bg=dark \| set linebreak<CR>

" UltiSnips
    let g:UltiSnipsExpandTrigger="<c-s>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Coc
autocmd VimEnter * CocDisable
function! s:check_back_space() abort
    let col= col('.') - 1
    return !col || getline('.')[col -1] =~# '\s'
endfunction

fun! Coc()
    inoremap <buffer> <silent><expr> <TAB>
                \ pumvisible() ? "\<C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()

    inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <buffer> <silent><expr> <c-space> coc#refresh()<CR>

    " GoTo code navigation
    nmap <buffer> ,gd <Plug>(coc-definition)
    nmap <buffer> ,gy <Plug>(coc-type-definition)
    nmap <buffer> ,gi <Plug>(coc-implementation)
    nmap <buffer> ,gr <Plug>(coc-references)
    nnoremap <buffer> ,cr :CocRestart<CR>
    nmap <space>e :CocCommand explorer<CR>
    autocmd VimEnter * CocEnable
endfunc

" YouCompleteMe
    fun! YCM()
        nnoremap <buffer> <silent> ,gd :YcmCompleter GoTo<CR>
        nnoremap <buffer> <silent> ,gr :YcmCompleter GoToReferences<CR>
        nnoremap <buffer> <silent> ,rr :YcmCompleter RefactorRename<space>
        let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_autoclose_preview_window_after_completion = 1
        let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
        let g:ycm_key_detailed_diagnostics = '<F1>d'
        let g:ycm_filepath_completion_use_working_dir = 1
        let g:ycm_auto_start_csharp_server = 1
        let g:ycm_auto_stop_csharp_server = 1
        let g:ycm_complete_in_strings = 0
        let g:ycm_show_diagnostics_ui = 1
    endfun
    let g:ycm_key_list_select_completion = []
    let g:ycm_global_ycm_extra_conf = '~/.config/nvim/plugged/YouCompleteMe/.ycm_extra_conf.py'

" Spell-check:
	map ,o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right
	set splitbelow splitright

" vimling:
	nm ,d :call ToggleDeadKeys()<CR>
	imap ,d <esc>:call ToggleDeadKeys()<CR>a
	nm ,i :call ToggleIPA()<CR>
	imap ,i <esc>:call ToggleIPA()<CR>a
	nm ,q :call ToggleProse()<CR>

" Nerd Config
	let g:NERDTreeGitStatusWithFlags = 1
	let NERDTreeShowHidden=1
    map <C-n> :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo for neomutt
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width = 80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>
    autocmd BufRead,BufNewFile /tmp/neomutt* let g:loaded_youcompleteme = 1

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritePre * %s/\n\+\%$//e

" Load Completer based on file type
    autocmd FileType sh,json,xml,yml,yaml,vim : call YCM()
    autocmd FileType c,h,cpp,cxx,hpp : call Coc()

" Automations:
" Update Xresources.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update sxhkdrc.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
