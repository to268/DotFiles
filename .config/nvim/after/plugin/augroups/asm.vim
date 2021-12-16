augroup asm
    autocmd!
    autocmd BufReadPost *.asm set ft=nasm
    autocmd BufReadPost *.s set filetype=gasm
augroup END
