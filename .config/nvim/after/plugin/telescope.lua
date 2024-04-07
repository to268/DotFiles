local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function set_fuzzy()
    local handle = io.popen("git rev-parse --git-dir 2> /dev/null", "r")
    if handle ~= nil then
        local cmd = handle:read('*a')
        handle:close()
        if cmd == '' then
            map("n", "<C-p>", function()
                builtin.find_files()
            end, opts)
        else
            map("n", "<C-p>", function()
                builtin.git_files()
            end, opts)
        end
    end
end

set_fuzzy()

map("n", "<leader>tl", ":Telescope<CR>", opts)

map("n", "<leader>gw", function()
    require('telescope').extensions.git_worktree.git_worktrees()
end, opts)

map("n", "<leader>sl", function()
    require('session-lens').search_session()
end, opts)

map("n", "<leader>ch", function()
    builtin.command_history()
end, opts)

map("n", "<leader>rg", function()
    builtin.live_grep()
end, opts)

map("n", "<leader>ht", function()
    builtin.help_tags()
end, opts)

map("n", "<leader>gb", function()
    builtin.git_branches()
end, opts)

map("n", "<leader>dc", function()
    require('telescope-doc').open_path({
        cwd = '$HOME/files/ext/data/pdf/'
    })
end, opts)

map("v", "<leader>rr", function()
    require('refactoring').select_refactor()
end, opts)

map("n", "<leader>fw", function ()
    builtin.grep_string({
        search = vim.fn.expand('<cword>')
    })
end, opts)

map("n", "<leader>df", function()
    builtin.find_files({
        shorten_path = false,
        cwd = "~/.config/nvim",
        prompt = "DotFiles",
    })
end , opts)

map("n", "<leader>bf", function()
    builtin.buffers({
        attach_mappings = function(_, local_map)
            local_map('i', '<c-d>', actions.delete_buffer)
            local_map('n', '<c-d>', actions.delete_buffer)
            return true
        end
    })
end, opts)

map("n", "<leader>fg", function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
