augroup asm
    autocmd!
    autocmd BufRead *.asm set ft=nasm
augroup END

augroup asm_s
    autocmd!
    autocmd BufReadPost *.s set filetype=gasm
augroup END
