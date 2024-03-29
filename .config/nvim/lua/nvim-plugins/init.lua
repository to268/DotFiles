return {
    {
        "RRethy/nvim-base16",
        priority = 1000,
        keys = {
            { "<leader>gv", ":lua Gruvbox()<CR>" }
        },
        lazy = false
    },

    {
        "hoob3rt/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            options = {
                theme = 'onedark',
                section_separators = {'', ''},
                component_separators = {'|', '|'},
                sources = {'nvim_diagnostic'},
                sections = {'error', 'warn', 'info', 'hint'},
                symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
                icons_enabled = true,
            },
            sections = {
                lualine_a = { {'mode', upper = true} },
                lualine_b = { {'branch', icon = ''} },
                lualine_c = { {'filename', file_status = true}, 'diagnostics' },
                lualine_x = { {
                    'diff',
                    colored = true,
                    symbols = {added = ' ', modified = ' ', removed = ' '},
                    source = nil,
                }, 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
                lualine_z = { 'location' },
            },
            inactive_sections = {
                lualine_a = {  },
                lualine_b = {  },
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {  },
                lualine_z = {   }
            },
            extensions = {'quickfix', 'toggleterm', 'symbols-outline', 'fugitive', 'nvim-tree'},
        },
        lazy = false
    },

    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        opts = {
            disable_netrw   = true,
            hijack_netrw    = false,
            open_on_tab     = false,
            hijack_cursor   = true,
            update_cwd      = false,
        },
        keys = {
            { "<C-n>", ":NvimTreeToggle<CR>" }
        },
        event = "VeryLazy"
    },
}
