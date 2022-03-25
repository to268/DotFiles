return require("packer").startup {
    function(use)
        -- Packer
        use "wbthomason/packer.nvim"

        -- Status Line
        use {
            'hoob3rt/lualine.nvim',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function() require('nvim-plugin.statusline') end
        }

        -- Dev Stuff
        use 'tpope/vim-dispatch'
        use 'octol/vim-cpp-enhanced-highlight'
        use 'tpope/vim-projectionist'
        use 'babaybus/DoxygenToolkit.vim'
        use 'ThePrimeagen/refactoring.nvim'
        use {
            'L3MON4D3/LuaSnip',
            requires = { 'rafamadriz/friendly-snippets' },
            config = function() require("nvim-plugin.snippets") end
        }
        use {
            'sindrets/diffview.nvim',
            config = function() require("diffview").setup({
                diff_binaries = true,
                use_icons = true,
                file_panel = {
                    position = "left",
                    width = 35,
                    height = 10,
                },
            })
            end
        }
        use {
            'norcalli/nvim-colorizer.lua',
            config = function() require("colorizer").setup({
                "*"; css = { rgb_fn = true; };
            }) end
        }
        use {
            'kyazdani42/nvim-tree.lua',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function() require('nvim-plugin.nvim_tree') end
        }
        use {
            'ThePrimeagen/git-worktree.nvim',
            config = function() require('git-worktree').setup() end
        }
        use 'rhysd/vim-llvm'

        -- Neovim LSP
        use 'glepnir/lspsaga.nvim'
        use 'tjdevries/nlua.nvim'
        use 'tjdevries/lsp_extensions.nvim'
        use 'ray-x/lsp_signature.nvim'
        use 'onsails/lspkind-nvim'
        use {
            'neovim/nvim-lspconfig',
            config = function() require('nvim-plugin.lsp') end
        }
        use {
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-calc",
                "hrsh7th/cmp-cmdline",
                "kdheepak/cmp-latex-symbols",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
                "ray-x/cmp-treesitter",
                "hrsh7th/cmp-nvim-lsp-document-symbol",
                "lukas-reineke/cmp-rg",
                "lukas-reineke/cmp-under-comparator",
                {
                    "petertriho/cmp-git",
                    requires = "nvim-lua/plenary.nvim",
                    config = function() require("cmp_git").setup() end
                },
                {
                    "saecki/crates.nvim",
                    requires = { { 'nvim-lua/plenary.nvim' } },
                    config = function()
                        require('crates').setup()
                    end,
                },
                {
                    "quangnguyen30192/cmp-nvim-tags",
                    ft = {
                        'kotlin',
                        'java'
                    }
                },
                "hrsh7th/cmp-path",
                {
                    'tzachar/cmp-tabnine',
                    run='./install.sh',
                    config = function()
                        local tabnine = require('cmp_tabnine.config')
                        tabnine:setup({
                            max_lines = 1000;
                            max_num_results = 20;
                            sort = true;
                        })
                    end
                },
                "f3fora/cmp-spell"
            }
        }
        use {
            'folke/lsp-trouble.nvim',
            config = function() require('trouble').setup({
                signs = {
                        error = "❌",
                        warning = "⚠ ",
                        hint = "💡",
                        information = ""}
            }) end
        }
        use {
            'simrat39/symbols-outline.nvim',
            config = function()
                vim.g.symbols_outline = {
                    highlight_hovered_item = true,
                    show_guides = true,
                    auto_preview = true,
                    position = 'right',
                    width = 35,
                    show_numbers = false,
                    show_relative_numbers = false,
                    show_symbol_details = true,
                    keymaps = {
                        close = "q",
                        goto_location = "<Cr>",
                        focus_location = "o",
                        hover_symbol = "<C-space>",
                        rename_symbol = "r",
                        code_actions = "a",
                    },
                }
            end
        }
        use {
            'j-hui/fidget.nvim',
            config = function() require('fidget').setup({
                text = {
                    spinner = "pipe",
                    done = "",
                    commenced = "Started",
                    completed = "Completed",
                },
                timer = {
                    spinner_rate = 100,
                    fidget_decay = 1500,
                    task_decay = 1200,
                },
                fmt = {
                    leftpad = true,
                    stack_upwards = false,
                }
            })
            end
        }

        -- Neovim DAP
        use 'rcarriga/nvim-dap-ui'
        use 'theHamsta/nvim-dap-virtual-text'
        use 'nvim-telescope/telescope-dap.nvim'
        use 'mfussenegger/nvim-dap'

        -- Neovim Tree Sitter
        use 'nvim-treesitter/nvim-treesitter-textobjects'
        use 'nvim-treesitter/playground'
        use {
            'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
            config = function() require('nvim-treesitter.configs').setup({
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
                    lint_events = {"BufWrite"},
                },
            }) end
        }
        use {
            'windwp/nvim-ts-autotag',
            config = function() require('nvim-ts-autotag').setup() end
        }

        -- Telescope
        use 'nvim-telescope/telescope-fzy-native.nvim'
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{ 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }},
            config = function() require('nvim-plugin.telescope') end
        }
        use {
            'to268/telescope-doc.nvim',
            requires = { 'nvim-lua/popup.nvim' }
        }
        use {
            'ptethng/telescope-makefile',
            requires = { 'akinsho/nvim-toggleterm.lua' }
        }

        -- Git
        use 'tveskag/nvim-blame-line'
        use {
            'tpope/vim-fugitive',
            config = function() require('nvim-plugin.fugitive') end
        }

        -- Comments
        use 'tpope/vim-surround'
        use {
            'numToStr/Comment.nvim',
            config = function() require('Comment').setup() end
        }

        -- Colorschemes
        use {
            'RRethy/nvim-base16',
            config = function() require('nvim-plugin.colorscheme').setup() end
        }

        -- Utils
        use 'rmagatti/auto-session'
        use 'vimwiki/vimwiki'
        use 'mhinz/vim-startify'
        use 'mbbill/undotree'
        use 'jbyuki/nabla.nvim'
        use 'dstein64/vim-startuptime'
        use 'jbyuki/venn.nvim'
        use 'nathom/filetype.nvim'
        use 'mhinz/vim-rfc'
        use {
            "nvim-neorg/neorg",
            config = function()
                require('neorg').setup {
                    load = {
                        ["core.defaults"] = {},
                        ["core.norg.concealer"] = {},
                        ["core.norg.dirman"] = {
                            config = {
                                workspaces = {
                                    my_workspace = "~/neorg"
                                }
                            }
                        }
                    },
                }
            end,
            requires = "nvim-lua/plenary.nvim"
        }
        use {
            'rmagatti/session-lens',
            requires = { 'rmagatti/auto-session' },
            config = function() require('session-lens').setup({
                previewer = false,
                prompt_title = 'Sessions',
            }) end
        }
        use {
            'numtostr/FTerm.nvim',
            config = function() require('FTerm') end
        }
        use {
            'jbyuki/instant.nvim',
            config = function()
                vim.g["instant_username"] = "to268"
            end
        }
        use {
            'soywod/himalaya',
            rtp = "vim"
        }
    end
}
