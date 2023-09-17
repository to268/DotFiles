local opt = vim.opt

-- Base
opt.cmdheight = 1
opt.encoding = "utf-8"
opt.mouse = ""
opt.number = true
opt.relativenumber = true
opt.scrolloff = 6
opt.shortmess:append "c"
opt.signcolumn = "yes"
opt.smartcase = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.updatetime = 50
opt.laststatus = 3

-- Always off
opt.backup = false
opt.belloff = "all"
opt.showmode = false
opt.swapfile = false
opt.wrap = false

-- Undo file
opt.undodir = os.getenv("HOME") .. "/.cache/undodir"
opt.undofile = true

-- Indenting
opt.smarttab = true
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4

-- Search
opt.ignorecase = true
opt.incsearch = true
opt.hlsearch = false

-- Windows
opt.splitbelow = true
opt.splitright = true
opt.hidden = true

-- Comments formatting
opt.formatoptions = opt.formatoptions
    - "a"
    - "t"
    + "c"
    + "q"
    - "o"
    + "r"
    + "n"
    + "j"
    - "2"

-- Set joinspaces
opt.joinspaces = false

-- Completion and wild option
opt.completeopt = { "menuone", "noinsert", "noselect" }
opt.wildmode = { "longest", "list", "full" }
opt.wildignore = { "*.o", "*.obj", "*.a", "*.bin", "*.elf", "*.iso", ".git",
                "*.rbc", "*.pyc", "*pycache", "__pycache__" }

-- Disable builtin plugins
require("nvim-config.disable_builtin")
