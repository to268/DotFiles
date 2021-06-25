" Automations
augroup automations
	autocmd!
	" Update Xresources
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
	" Update plugins.lua
	autocmd BufWritePost plugins.lua PackerCompile
	" Update sxhkdrc
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
	" Sort packages.txt
	autocmd BufWritePost packages.txt sort
augroup END
