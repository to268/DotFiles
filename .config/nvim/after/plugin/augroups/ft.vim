augroup ft
    autocmd!
    autocmd BufNewFile,BufRead,BufReadPost *.asm set ft=nasm
    autocmd BufNewFile,BufRead,BufReadPost *.s set filetype=gasm
    autocmd BufNewFile,BufRead,BufReadPost *.vert,*.tesc,*.tese,*.geom,*.frag,*.comp set ft=glsl
augroup END
