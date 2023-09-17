return {
    {
        "TymekDev/repos.nvim",
        lazy = true
    },

    {
        "nvim-tree/nvim-web-devicons",
        lazy = true
    },

    {
        "tveskag/nvim-blame-line",
        keys = {
            { "<leader>bl", "<cmd>ToggleBlameLine<CR>" }
        },
        event = "VeryLazy"
    },

    {
        "mbbill/undotree",
        keys = {
            { "<leader>u", "<cmd>UndotreeToggle<CR>" }
        },
        event = "VeryLazy"
    },

    {
        "mhinz/vim-rfc",
        event = "VeryLazy"
    },

    {
        "tpope/vim-fugitive",
        keys = {
            { "<leader>g", "<cmd>Git<CR>" },
            { "<leader>ga", "<cmd>Git add -A<CR>" },
            { "<leader>gc", "<cmd>Git commit<CR>" },
            { "<leader>gch", "<cmd>GBranches<CR>" },
            { "<leader>gd", "<cmd>Gdiffsplit<CR>" },
            { "<leader>gf", "<cmd>Git fetch --all<CR>" },
            { "<leader>gu", "<cmd>diffget //2<CR>" },
            { "<leader>gh", "<cmd>diffget //3<CR>" },
            { "<leader>gl", "<cmd>GlLog<CR>" },
            { "<leader>gpl", "<cmd>Git pull<CR>" },
            { "<leader>gps", "<cmd>Git push<CR>" },
            { "<leader>gt", "<cmd>GTags<CR>" }
        },
        event = "VeryLazy"
    },

    {
        "numtostr/FTerm.nvim",
        opts = {},
        keys = {
            { "<leader>tf", function() require('FTerm').toggle() end }
        },
        event = "VeryLazy"
    },

    {
        "rmagatti/auto-session",
        opts = {},
        keys = {
            { "<leader>ss", "<cmd>SessionSave<CR>" },
            { "<leader>sr", "<cmd>SessionRestore<CR>" }
        },
        lazy = false
    },

    {
        "ThePrimeagen/git-worktree.nvim",
        opts = {},
        config = function ()
            local Worktree = require("git-worktree")
            local AutoSession = require("auto-session")
            local NvimTree = require("nvim-tree.api")

            Worktree.on_tree_change(function(op, metadata)
                if op == Worktree.Operations.Switch then
                    -- Restore session
                    AutoSession.RestoreSession(metadata.path)
                    -- Refresh path in nvim-tree
                    NvimTree.tree.toggle({path = metadata.path})
                    NvimTree.tree.toggle({path = metadata.path})
                end
            end)
        end,
        event = "VeryLazy"
    },

    {
        "norcalli/nvim-colorizer.lua",
        opts = {},
        event = "VeryLazy"
    },

    {
        "numToStr/Comment.nvim",
        opts = {},
        event = "VeryLazy"
    },

    {
        "laytan/cloak.nvim",
        opts = {},
        lazy = false
    }
}
