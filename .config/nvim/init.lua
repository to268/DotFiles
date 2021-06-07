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
-- base configuration:
--       in ./lua/nvim-config/*.lua
--
-- plugins configuration:
--       in ./lua/nvim-plugin/*.lua
--
-- others configurations:
--       in ./after/plugin/*.vim
--
-- others plugin configurations:
--       in ./plugins/*.vim

vim.g.mapleader = " "

-- Setup packer
require "nvim-config.packer"

-- Load plugins
require "nvim-config.plugins"

-- Load options
require "nvim-config.options"
