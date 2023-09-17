return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            pcall(require("nvim-treesitter.install").update { with_sync = true })
        end,
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = "all",
                sync_install = false,
                auto_install = true,

                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
            "nvim-treesitter/nvim-treesitter-context",
            "nvim-treesitter/playground",
        },
        event = 'VeryLazy'
    },
}
