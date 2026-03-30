--
--   ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
--   ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
--   ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
--   ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
--   ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
--   ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- Config Structure:
--
-- base configurations:
--       in ./lua/nvim-config/*.lua
--
-- plugins configurations:
--       in ./lua/nvim-plugin/*.lua
--
-- lsp configurations:
--       in ./lsp/*.lua
--

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Load config and plugins
require("nvim-config")
require("nvim-plugins")
