" Disables automatic commenting on newline
augroup commenting
	autocmd!
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END
