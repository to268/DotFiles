" Neovim DAP augroup
augroup dap
    autocmd!
    autocmd BufEnter * :lua require('nvim-plugin.dap').remap()
augroup END
