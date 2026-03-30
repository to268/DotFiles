local opt = vim.opt

-- Base
opt.cmdheight = 1 -- single line command line
opt.encoding = "utf-8" -- set encoding
opt.mouse = "" -- disable mouse support
opt.wrap = false -- do not wrap lines by default
opt.number = true -- line number
opt.relativenumber = true -- relative line numbers
opt.scrolloff = 6 -- keep 6 lines above/below cursor
opt.sidescrolloff = 6 -- keep 6 lines to left/right of cursor
opt.cursorline = false -- no highlight current line
opt.laststatus = 3 -- shares the same status line between windows
opt.autoread = true -- auto-reload changes if outside of neovim
opt.autowrite = false -- do not auto-save
opt.redrawtime = 2000 -- redraw tolerance
opt.maxmempattern = 200000 -- pattern matching memory
opt.belloff = "all" -- disable off bell sounds
opt.errorbells = false -- no bell sound on errors
opt.backspace = { "indent", "eol", "start" } -- better backspace behavior
opt.autochdir = false -- do not auto change directories
opt.iskeyword:append("-") -- include - in words
opt.path:append("**") -- include subdirs in search
opt.selection = "inclusive" -- include last char in selection
opt.modifiable = true -- allow buffer modifications
opt.more = false -- do not pause command output if there is too much lines to fit on the screen
opt.list = false -- do not show invisible characters (tabs, spaces, non-breakable spaces)
opt.inccommand = "split" -- show substitutions changes in a separate window
opt.shada = { "'20", "<40", "s10", "h" }  -- save marks for 20 files, save last 40 lines of history, save registers ≤10KB, minimal extra info

-- Timeouts
opt.updatetime = 50 -- faster completion
opt.timeoutlen = 400 -- timeout duration
opt.ttimeoutlen = 0 -- key code timeout

-- Indent
opt.tabstop = 4 -- tab width
opt.shiftwidth = 4 -- indent width
opt.softtabstop = 4 -- soft tab stop not tabs on tab/backspace
opt.expandtab = true -- use spaces instead of tabs
opt.smartindent = true -- smart auto-indent
opt.autoindent = true -- copy indent from current line

-- Search
opt.ignorecase = true -- case insensitive search
opt.smartcase = false -- no case sensitive in search
opt.hlsearch = false -- no highlight in search matches
opt.incsearch = true -- show matches as you type

-- Backups
opt.backup = false -- do not create a backup file
opt.writebackup = false -- do not write to a backup file
opt.swapfile = false -- do not create a swap file
opt.undofile = true -- do create an undo file
opt.undodir = os.getenv("HOME") .. "/.cache/undodir" -- set the undo directory

-- Windows
opt.hidden = true -- allow hidden buffers
opt.splitbelow = true -- horizontal splits go below
opt.splitright = true -- vertical splits go right
opt.winblend = 0 -- floating window transparency
opt.winborder = "rounded" -- rounded borders on windows

-- Folding
opt.foldmethod = "expr" -- use expression for folding
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
opt.foldlevel = 99 -- start with all folds open

-- Visuals
opt.signcolumn = "yes" -- always show a sign column
opt.showmatch = false -- do not highlight matching brackets
opt.showmode = false -- do not show the mode
opt.conceallevel = 0 -- do not hide markup
opt.concealcursor = "" -- do not hide cursor line in markup
opt.lazyredraw = false -- do not redraw during macros
opt.synmaxcol = 3000 -- syntax highlighting limit
opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,t:block-blinkon500-blinkoff500-TermCursor" -- cursor settings

-- Formatting
opt.joinspaces = false -- only add one space after joining a sentence
opt.formatoptions:remove("a") -- do not auto-format paragraphs
opt.formatoptions:remove("t") -- do not auto-wrap text
opt.formatoptions:append("c") -- auto-wrap comments using text width
opt.formatoptions:remove("o") -- do not continue comments on o/O
opt.formatoptions:append("r") -- continue comments in insert mode
opt.formatoptions:append("n") -- format numbered lists correctly
opt.formatoptions:append("j") -- remove comment leader when joining lines
opt.formatoptions:remove("2") -- do not use the same indent as the 2nd line of a paragraph

-- Completion
opt.wildmenu = true -- tab completion
opt.wildmode = { "longest", "list", "full" } -- completion matching rules
opt.diffopt:append("linematch:60") -- add more context between a hunk in diff mode
opt.wildignore = { "*.o", "*.obj", "*.a", "*.bin", "*.elf", "*.iso", ".git",
                "*.rbc", "*.pyc", "*pycache", "__pycache__" } -- file patterns to ignore
opt.completeopt = { "fuzzy", "menuone", "noinsert", "noselect" } -- completion options

-- Disable builtin plugins
require("nvim-config.disable_builtin")
