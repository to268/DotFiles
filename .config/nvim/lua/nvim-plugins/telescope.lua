return {
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-tree/nvim-web-devicons" },
            { "to268/telescope-doc.nvim" },
            { "nvim-telescope/telescope-ui-select.nvim" },
            { "nvim-telescope/telescope-fzy-native.nvim" },
            { "ThePrimeagen/git-worktree.nvim" },
            {
                "ThePrimeagen/refactoring.nvim",
                opts = {},
                dependencies = {
                    "nvim-lua/plenary.nvim",
                    "nvim-treesitter/nvim-treesitter"
                },
            },
            {
                "rmagatti/session-lens",
                dependencies = { "rmagatti/auto-session" },
                opts = {
                    previewer = false,
                    prompt_title = "Sessions",
                },
            },
        },
        config = function ()
            local actions = require('telescope.actions')
            local previewers = require('telescope.previewers')

            require('telescope').setup {
                defaults = {
                    file_sorter = require('telescope.sorters').get_fzy_sorter,
                    prompt_prefix = ' ',
                    color_devicons = true,

                    file_previewer   = previewers.vim_buffer_cat.new,
                    grep_previewer   = previewers.vim_buffer_vimgrep.new,
                    qflist_previewer = previewers.vim_buffer_qflist.new,

                    mappings = {
                        i = {
                            ["<C-q>"] = actions.smart_send_to_qflist,
                        },
                        n = {
                            ["<C-q>"] = actions.smart_send_to_qflist,
                            ["<C-a>"] = actions.select_all,
                            ["<C-s>"] = actions.toggle_selection,
                            ["<C-d>"] = actions.drop_all,
                        },
                    }
                },
                extensions = {
                    fzy_native = {
                        override_generic_sorter = false,
                        override_file_sorter = true,
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            }

            require('telescope').load_extension('fzy_native')
            require('telescope').load_extension('session-lens')
            require('telescope').load_extension('git_worktree')
            require("telescope").load_extension("ui-select")
        end,
        event = "VeryLazy"
    },
}
