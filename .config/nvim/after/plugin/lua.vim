" Loading statusline
lua require("statusline")

" Loading Neovim LSP
lua require("lsp-config").launchServers()
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Loading Tree Sitter
lua require("treesitter")
