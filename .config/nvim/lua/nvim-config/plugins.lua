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
        use 'SirVer/ultisnips'
        use 'honza/vim-snippets'

        use {
            'norcalli/nvim-colorizer.lua',
            config = function() require("colorizer").setup({
                "*"; css = { rgb_fn = true; };
            }) end
        }

        use 'tpope/vim-dispatch'
        use 'octol/vim-cpp-enhanced-highlight'
        use 'tpope/vim-projectionist'
        use 'cohama/lexima.vim'

        use {
            'kyazdani42/nvim-tree.lua',
            requires = { 'kyazdani42/nvim-web-devicons', opt = true },
            config = function() require('nvim-plugin.nvim_tree') end
        }

        use 'jbyuki/monolithic.nvim'

        use {
            'ThePrimeagen/git-worktree.nvim',
            config = function() require('git-worktree').setup() end
        }

        -- DAP
        use "theHamsta/nvim-dap-virtual-text"
        use "nvim-telescope/telescope-dap.nvim"
        use {
            'rcarriga/nvim-dap-ui',
            requires = { 'mfussenegger/nvim-dap'}
        }

        use {
            'Pocco81/DAPInstall.nvim',
            config = function()
                local dap_install = require("dap-install")
                dap_install.setup()

                dap_install.config("ccppr_lldb_dbg", {})
                dap_install.config("jsnode_dbg", {})
                dap_install.config("lua_dbg", {})
                dap_install.config("python_dbg", {})
            end
        }

        -- Neovim LSP
        use {
            'neovim/nvim-lspconfig',
            config = function() require('nvim-plugin.lsp') end
        }

        use 'nvim-lua/completion-nvim'
        use 'tjdevries/nlua.nvim'
        use 'tjdevries/lsp_extensions.nvim'

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

        use 'onsails/lspkind-nvim'

        -- Neovim Tree Sitter
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
                    lint_events = {"BufWrite", "CursorHold"},
                },
            }) end
        }
        use 'nvim-treesitter/nvim-treesitter-textobjects'
        use 'nvim-treesitter/playground'
        use 'bryall/contextprint.nvim'

        -- Telescope
        use {
            'nvim-telescope/telescope.nvim',
            requires = {{ 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' }},
            config = function() require('nvim-plugin.telescope') end
        }

        use 'nvim-telescope/telescope-fzy-native.nvim'
        use 'nvim-telescope/telescope-packer.nvim'
        use {
            'nvim-telescope/telescope-cheat.nvim',
            requires = { 'tami5/sql.nvim' }
        }
        use {
            'nvim-telescope/telescope-frecency.nvim',
            requires = { 'tami5/sql.nvim' }
        }

        use {
            'to268/telescope-doc.nvim',
            requires = { 'nvim-lua/popup.nvim' }
        }

        -- Git
        use 'jreybert/vimagit'

        use {
            'tpope/vim-fugitive',
            config = function() require('nvim-plugin.fugitive') end
        }

        use 'tveskag/nvim-blame-line'

        -- Comments
        use 'b3nj5m1n/kommentary'
        use 'tpope/vim-surround'

        -- Colorschemes
        use {
            'RRethy/nvim-base16',
            config = function() require('nvim-plugin.colorscheme').setup() end
        }

        -- Utils
        use 'dbeniamine/cheat.sh-vim'
        use 'rmagatti/auto-session'
        use {
            'rmagatti/session-lens',
            requires = { 'rmagatti/auto-session' },
            config = function() require('session-lens').setup({
                shorten_path = false,
                previewer = false,
                prompt_title = 'Sessions',
            }) end
        }

        use {
            'numtostr/FTerm.nvim',
            config = function() require('FTerm').setup() end
        }

        use 'vimwiki/vimwiki'
        use 'mhinz/vim-startify'
        use 'mbbill/undotree'
        use 'jbyuki/nabla.nvim'
        use "dstein64/vim-startuptime"
        use 'jbyuki/venn.nvim'
        use {
            'jbyuki/instant.nvim',
            config = function()
                vim.g["instant_username"] = "to268"
            end
        }

        use {
            'vuciv/vim-bujo',
            config = function() require('nvim-plugin.bujo') end
        }

        use 'mhinz/vim-rfc'

    end
}
