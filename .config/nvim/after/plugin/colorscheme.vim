" Trasparent Background
fun! Transparent()
    highlight Normal guibg=none
    highlight LineNr guibg=none
    highlight SignColumn guibg=none
    highlight CursorLineNR guibg=none
endfun

" Gruvbox Color Scheme
fun! Gruvbox()
    let g:gruvbox_constrast_dark = 'hard'
    let g:gruvbox_invert_selection = '0'
    highlight Todo guifg=lightwhite
    colorscheme gruvbox
    set background=dark
endfun

" OneDark Color Scheme
fun! OneDark()
    colorscheme onedark
    set background=dark
endfun

" Load Gruvbox by default
colorscheme gruvbox
