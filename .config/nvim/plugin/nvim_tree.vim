let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }

let g:nvim_tree_icons = {
    \ 'default':        '',
    \ 'symlink':        '',
    \ 'git': {
    \   'unstaged':     "✗",
    \   'staged':       "✓",
    \   'merged':       "═",
    \   'unmerged':     "",
    \   'renamed':      "➜",
    \   'untracked':    "★",
    \   'deleted':      "",
    \   },
    \ 'folder': {
    \   'arrow_open':   "",
    \   'arrow_closed': "",
    \   'default':      "",
    \   'open':         "",
    \   'empty':        "",
    \   'empty_open':   "",
    \   'symlink':      "",
    \   'symlink_open': "",
    \   },
    \  'lsp': {
    \    'hint':        "",
    \    'info':        "",
    \    'warning':     "",
    \    'error':       "",
    \  }
    \ }

" Base Colors
hi NvimTreeSymlink guifg=blue gui=bold,underline
hi NvimTreeSpecialFile guifg=orange gui=bold,underline
hi NvimTreeExecFile guifg=orange gui=bold
hi NvimTreeEmptyFolderName guifg=lightblue gui=none
hi NvimTreeRootFolder guifg=red gui=bold

" Git Colors
hi NvimTreeGitNew guifg=magenta
hi NvimTreeGitDirty guifg=red
hi NvimTreeFileDirty guifg=red
hi NvimTreeFileNew guifg=lightmagenta
hi NvimTreeGitStaged guifg=lightgreen
hi NvimTreeFileStaged guifg=grey
hi NvimTreeGitMerge guifg=yellow
