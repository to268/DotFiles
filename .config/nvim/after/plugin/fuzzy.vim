" Set the fuzzy finder to use if we are in a git repo or not
fun! SetFuzzy()
    let l:gitcmd = system("git rev-parse --git-dir 2> /dev/null")
    if (l:gitcmd == '')
        nnoremap <C-p> <cmd>lua require'telescope.builtin'.find_files{}<CR>
        return
    endif
    nnoremap <C-p> <cmd>lua require'telescope.builtin'.git_files{}<CR>
endfun

call SetFuzzy()
