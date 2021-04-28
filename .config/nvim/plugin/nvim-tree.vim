let g:nvim_tree_side = 'left'
let g:nvim_tree_width = 40
let g:nvim_tree_ignore = [ 'node_modules', '.cache' ]
let g:nvim_tree_auto_open = 0
let g:nvim_tree_auto_close = 1
let g:nvim_tree_auto_ignore_ft = [ 'startify' ]
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_follow = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_hide_dotfiles = 0
let g:nvim_tree_git_hl = 1
let g:nvim_tree_root_folder_modifier = ':~'
let g:nvim_tree_tab_open = 0
let g:nvim_tree_width_allow_resize  = 1
let g:nvim_tree_disable_netrw = 0
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }

let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'merged': "═",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   }
    \ }

nnoremap <silent><C-n> :NvimTreeToggle<CR>
nnoremap <silent><leader>ntr :NvimTreeRefresh<CR>
nnoremap <silent><leader>ntf :NvimTreeFindFile<CR>
