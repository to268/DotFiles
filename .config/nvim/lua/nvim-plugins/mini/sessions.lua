local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function get_session_name()
    local git_cmd = "git rev-parse --show-toplevel 2>/dev/null"
    local git_toplevel_list = vim.fn.system(git_cmd)
    local git_toplevel = git_toplevel_list or ""

    if not git_toplevel or git_toplevel == "" then
        return "" -- should not save a session outside of a git repo
    end

    local worktrees = vim.fn.systemlist("git worktree list")
    local is_worktree = in_git_dir()

    local function basename(path)
        return path:match("^.+/(.+)$") or path
    end

    if #worktrees == 1 then
        return basename(git_toplevel:gsub("\n$", "")) .. ".vim"
    end

    if not is_worktree then
        return "" -- should not save a session outside of a worktree for a bare repo
    end

    local git_root, worktree = git_toplevel:match("^(.*)/([^/]*)$")
    return basename(git_root) .. "%" .. worktree:gsub("\n$", "") .. ".vim"
end

local function check_if_session_exists()
    local function is_file(path)
        local stat = vim.loop.fs_stat(path)
        return stat and stat.type == "file"
    end

    return is_file(vim.fs.joinpath(vim.fn.stdpath("data"), "session", get_session_name()))
end

require("mini.sessions").setup({
  -- Whether to read default session if Neovim opened without file arguments
  autoread = check_if_session_exists(),

  -- Whether to write currently read session before leaving it
  autowrite = true,

  -- Whether to force possibly harmful actions (meaning depends on function)
  force = { read = false, write = true, delete = true },

  -- Hook functions for actions. Default `nil` means 'do nothing'.
  hooks = {
    -- Before successful action
    pre = { read = nil, write = nil, delete = nil },
    -- After successful action
    post = { read = nil, write = nil, delete = nil },
  },

  -- Whether to print session path after action
  verbose = { read = false, write = true, delete = true },
})

map("n", "<leader>sl", function()
    require("mini.sessions").select()
end, opts)
map("n", "<leader>sd", function()
    require("mini.sessions").select('delete')
end, opts)
map("n", "<leader>ss", function()
    require("mini.sessions").write(get_session_name())
end, opts)
