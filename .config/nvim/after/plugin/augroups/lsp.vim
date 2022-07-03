" Neovim LSP augroup
augroup lsp
    autocmd!
    autocmd CursorHold * :lua require('lsp_signature').signature()
augroup END
