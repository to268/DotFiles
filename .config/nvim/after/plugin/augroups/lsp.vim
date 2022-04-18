" Neovim LSP augroup
augroup lsp
    autocmd!
    autocmd CursorHold * :lua require('lsp_signature').signature()
    "autocmd BufEnter *.rs :lua require('rust-tools').setup({})
augroup END
