--[[
    NOTICE:
    The plugin has been taken from: https://github.com/TymekDev/repos.nvim
    I've fixed a few things and this copy will exist while my PR hasn't been merged
--]]
local M = {}

local defaults = {
    remote = "origin",
    callbacks = {},
}

local function strip_dot_git(str)
    return str:gsub(".git$", "")
end

local function is_invalid_git_worktree(root)
    if root:find("fatal: not a git repository") ~= nil then
        return true
    elseif root:find("fatal: this operation must be run in a work tree") ~= nil then
        return true
    end

    return false
end

M.setup = function(config)
    config = vim.tbl_deep_extend("keep", config or {}, defaults)
    if vim.tbl_count(config.callbacks) == 0 then
        return
    end

    local root = vim.fn.system({ "git", "rev-parse", "--show-toplevel" })
    if is_invalid_git_worktree(root) then
        return
    end

    vim.fn.jobstart({ "git", "remote", "get-url", config.remote }, {
        on_stdout = function(_, data)
            if data[1] == "" then
                return
            end

            for key, callback in pairs(config.callbacks) do
                key = strip_dot_git(key)
                data[1] = strip_dot_git(data[1])

                if key == data[1] or data[1]:find(key) ~= nil then
                    callback(root:gsub("\n$", ""))
                end
            end
        end,
        stdout_buffered = true,
    })
end

return M
