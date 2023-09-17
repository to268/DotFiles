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

-- Load config
require("nvim-config")
