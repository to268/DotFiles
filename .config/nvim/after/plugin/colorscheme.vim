" Trasparent Background
fun! Transparent()
    highlight Normal guibg=none
    highlight LineNr guibg=none
    highlight SignColumn guibg=none
    highlight CursorLineNR guibg=none
endfun

" Gruvbox Color Scheme
fun! Gruvbox()
    set background=dark
    lua for k in pairs(package.loaded) do if k:match("^colorscheme") then package.loaded[k] = nil end end
    lua require("colorscheme")
endfun

" OneDark Color Scheme
fun! OneDark()
    set background=dark
    lua require('base16-colorscheme').setup("onedark")
endfun

" Load Gruvbox by default
lua require("colorscheme")
