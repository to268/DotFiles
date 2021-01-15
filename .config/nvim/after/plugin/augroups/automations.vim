" Automations
augroup automations
	autocmd!
	" Update Xresources
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
	" Update sxhkdrc
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
augroup END
