" Trasparent Background 
fun! Transparent()
    highlight Normal guibg=none
    highlight LineNr guibg=none
endfun

" Gruvbox Color Scheme
fun! Gruvbox()
    let g:gruvbox_constrast_dark = 'hard'
    let g:gruvbox_invert_selection = '0'
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
