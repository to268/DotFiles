" Rg
if executable('rg')
    let g:rg_derive_root='true'
endif

" Vim.cpp
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

" Sessions
let g:auto_session_pre_save_cmds = ["tabdo NvimTreeClose"]
nnoremap <silent><leader>ss :SaveSession<CR>
nnoremap <silent><leader>sr :RestoreSession<CR>

" BlameLine
nnoremap <silent><leader>bl :ToggleBlameLine<CR>

" Nabla
nnoremap <F5> :lua require("nabla").replace_current()<CR>

" Himalaya
let g:himalaya_mailbox_picker = 'telescope'
command! -nargs=* Himalaya call himalaya#msg#list(<f-args>)

" Sql completion
let g:ftplugin_sql_omni_key = '<Nop>'

" DiffView
nnoremap <silent><leader>dvo :DiffviewOpen<CR>
nnoremap <silent><leader>dvc :DiffviewClose<CR>

" Reload config
nnoremap <leader><F5> :lua require("plenary.reload").reload_module("init.lua")<CR>

" LLVM setup
fun! SetupLLVM()
    set softtabstop=2
    set shiftwidth=2
    set expandtab

    augroup csrc
      au!
      autocmd FileType *      set nocindent smartindent
      autocmd FileType c,cpp  set cindent
    augroup END

    set cinoptions=:0,g0,(0,Ws,l1
    set smarttab

    autocmd FileType make set noexpandtab

    command! Untab :%s/\t/  /g
endfun!

command! SetupLLVM :call SetupLLVM()
