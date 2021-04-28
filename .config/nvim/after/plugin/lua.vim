" Loading statusline
lua require("statusline")

" Loading Neovim LSP
lua require("lsp-config")
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

" Loading Telescope
lua require("telescope-config")

" Loading colorizer
lua require("colorizer").setup({"*"; css = { rgb_fn = true; };})

" Loading lsp-trouble
lua require("trouble").setup({signs = { error = "❌", warning = "⚠ ", hint = "💡", information = ""}})

" Loading FloatTerm
lua require('FTerm').setup()

" Loading git-worktree
lua require("git-worktree").setup()

" Loading Tree Sitter
lua require("treesitter")
