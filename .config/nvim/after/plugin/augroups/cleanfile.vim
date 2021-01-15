fun! CleanFile()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    keeppatterns %s/\n\+\%$//e
    call winrestview(l:save)
endfun

" Automatically deletes all trailing whitespace and lines on save
augroup cleanFile
	autocmd!
	autocmd BufWritePre * :call CleanFile()
augroup END
