" Loading statusline
lua require("statusline")

" Loading Neovim LSP
lua require("lsp-config")
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Loading Telescope
lua require("telescope-config")

" Loading Tree Sitter
lua require("treesitter")
