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
    set bg=light
    set go=a
    set mouse=a
    set clipboard=unnamed
    nnoremap c "_c
    set nocompatible
    filetype plugin on
    syntax on
    set encoding=utf-8
    set number
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
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" UltiSnips
    let g:UltiSnipsExpandTrigger="<c-s>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" YouCompleteMe
    nnoremap <F2> :YcmCompleter GoToDeclaration<CR>
    nnoremap <F3> :YcmCompleter GoToDefinition<CR>
    nnoremap <F4> :YcmCompleter GoToReferences<CR>
    nnoremap <F6> :YcmCompleter GoToImplementation<CR>
    nnoremap <F7> :YcmCompleter GoToType<CR>
    nnoremap <F8> :YcmCompleter GetType<CR>
    nnoremap <F9> :YcmCompleter GetParent<CR>
    nnoremap <F10> :YcmCompleter GetDoc<CR>
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_autoclose_preview_window_after_completion = 1
    let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']
    let g:ycm_key_detailed_diagnostics = '<F1>d'
    let g:ycm_filepath_completion_use_working_dir = 1
    let g:ycm_auto_start_csharp_server = 1
    let g:ycm_auto_stop_csharp_server = 1
    let g:ycm_complete_in_strings = 0
    let g:ycm_show_diagnostics_ui = 1
    let g:ycm_filetype_blacklist = {
        \ 'tagbar': 1,
        \ 'notes': 1,
        \ 'markdown': 1,
        \ 'netrw': 1,
        \ 'unite': 1,
        \ 'text': 1,
        \ 'vimwiki': 1,
        \ 'pandoc': 1,
        \ 'infolog': 1,
        \ 'leaderf': 1,
        \ 'mail': 1,
        \ 'elf': 1,
        \ 'exe': 1
        \}
    let g:ycm_filetype_specific_completion_to_diasble = {
        \ 'gitcommit': 1
        \}
    let g:ycm_filepath_blacklist = {
        \ 'html': 1,
        \ 'css': 1,
        \ 'jsx': 1,
        \ 'json': 1,
        \ 'xml': 1,
        \ 'yml': 1,
        \ 'yaml': 1,
        \}

" Spell-check:
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right
	set splitbelow splitright

" vimling:
	nm <leader>d :call ToggleDeadKeys()<CR>
	imap <leader>d <esc>:call ToggleDeadKeys()<CR>a
	nm <leader>i :call ToggleIPA()<CR>
	imap <leader>i <esc>:call ToggleIPA()<CR>a
	nm <leader>q :call ToggleProse()<CR>

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

" automations:
" Update ranger
	autocmd BufWritePost files,directories !shortcuts
" Update Xresources.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update sxhkdrc.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd