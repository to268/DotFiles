" Neovim LSP augroup
augroup lsp
    autocmd!
    autocmd CursorHold * :lua require('lsp_signature').signature()
    "autocmd BufReadPost *.rs :lua require('rust-tools').setup({})
augroup END
