" Rg
if executable('rg')
    let g:rg_derive_root='true'
endif

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-s>"

" Vim.cpp
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Sessions
let g:auto_session_pre_save_cmds = ["tabdo NvimTreeClose"]
nnoremap <silent><leader>ss :SaveSession<CR>
nnoremap <silent><leader>sr :RestoreSession<CR>

" Monolithic
nnoremap <leader>ea :lua require"monolithic".open()<CR>

" BlameLine
nnoremap <silent><leader>bl :ToggleBlameLine<CR>

" Nabla
nnoremap <F5> :lua require("nabla").replace_current()<CR>

" Context Print
nnoremap <silent><leader>Ps :lua require("contextprint").add_statement()<CR>
nnoremap <silent><leader>ps :lua require("contextprint").add_statement(true)<CR>
