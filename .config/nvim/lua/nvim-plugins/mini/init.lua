vim.pack.add({
    "https://www.github.com/echasnovski/mini.nvim"
})

function in_git_dir()
    local is_worktree = vim.fn.systemlist("git rev-parse --is-inside-work-tree 2>/dev/null")
    return is_worktree[1] == "true"
end

local function in_dev_dir()
    local home = os.getenv("HOME")
    local dev_path = home .. "/files/Dev"
    local cwd = vim.fn.getcwd()

    if cwd:sub(1, #dev_path) == dev_path then
        return true
    else
        return false
    end
end

require('mini.extra').setup({})
require('mini.notify').setup({})
require('mini.trailspace').setup({})

if in_git_dir() then
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }
    local MiniGit = require("mini.git")

    MiniGit.setup({})
    map("n", "<leader>gl", function() MiniGit.show_at_cursor() end, opts)
end

if in_dev_dir() then
    require("nvim-plugins.mini.sessions")
end

require("nvim-plugins.mini.base16")
require("nvim-plugins.mini.statusline")
