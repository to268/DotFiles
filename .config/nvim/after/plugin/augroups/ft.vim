augroup ft
    autocmd!
    " ASM
    autocmd BufNewFile,BufRead,BufReadPost *.asm set ft=nasm
    autocmd BufNewFile,BufRead,BufReadPost *.s set filetype=asm
    " Vulkan
    autocmd BufNewFile,BufRead,BufReadPost *.vert,*.tesc,*.tese,*.geom,*.frag,*.comp set ft=glsl
    " LLVM
    autocmd BufNewFile,BufRead,BufReadPost *.ll set ft=llvm
    autocmd BufNewFile,BufRead,BufReadPost *.mlir set filetype=mlir
    autocmd BufNewFile,BufRead,BufReadPost *.td set filetype=tablegen
augroup END
