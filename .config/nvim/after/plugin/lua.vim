" Loading statusline
lua require("statusline").statusline()

" Loading Neovim LSP
lua require("lsp-config").launchServers()
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Loading Telescope
lua require("telescope-config").setup()

" Loading Tree Sitter
lua require("treesitter").launchTreeSitter()
