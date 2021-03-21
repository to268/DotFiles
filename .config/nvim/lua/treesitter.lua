local configs = require("nvim-treesitter.configs")

configs.setup {
    ensure_installed = "all",
    highlight = {
        enable = true,
    },
    indent = {
        enable = true
    },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = {"BufWrite", "CursorHold"},
    },
}
