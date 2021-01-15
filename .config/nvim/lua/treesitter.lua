local configs = require("nvim-treesitter.configs")

local function launchTreeSitter()
    configs.setup {
        query_linter = {
            enable = true,
            use_virtual_text = true,
            lint_events = {"BufWrite", "CursorHold"},
        },
        highlight = { enable = true },
    }
end

return {
    launchTreeSitter = launchTreeSitter
}
