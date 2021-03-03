" LSP remaps
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <silent><c-space> <Plug>(completion_trigger)
nnoremap <silent><leader>vds <cmd>lua require('telescope.builtin').lsp_document_symbols{}<CR>
nnoremap <silent><leader>vws <cmd>lua require('telescope.builtin').lsp_workspace_symbols{}<CR>
nnoremap <silent><leader>vrn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent><leader>vi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent><leader>vd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent><leader>vh <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent><leader>vs <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent><leader>vt <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent><leader>vr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent><leader>vf <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent><leader>va <cmd>lua vim.lsp.buf.code_action()<CR>
