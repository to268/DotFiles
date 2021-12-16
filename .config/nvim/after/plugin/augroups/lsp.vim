" Neovim LSP augroup
augroup lsp
    autocmd!
    autocmd CursorHold * :lua require('lsp_signature').signature()
    autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs :lua require'lsp_extensions'.inlay_hints()
augroup END
