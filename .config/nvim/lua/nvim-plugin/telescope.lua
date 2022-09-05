local actions = require('telescope.actions')
local map = vim.api.nvim_set_keymap

local M = {}

require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' ',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-s>"] = actions.select_default:replace(goto_file_selection_split),
                ["<C-q>"] = actions.smart_send_to_qflist,
            },
            n = {
                ["<C-q>"] = actions.smart_send_to_qflist,
                ["<C-a>"] = actions.select_all,
                ["<C-s>"] = actions.toggle_selection,
                ["<C-d>"] = actions.drop_all,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown {}
        }
    }
}

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('session-lens')
require('telescope').load_extension('git_worktree')
require("telescope").load_extension("ui-select")

local opts = { noremap = true, silent = true }

local function set_fuzzy()
    local handle = io.popen("git rev-parse --git-dir 2> /dev/null", "r")
    local cmd = handle:read('*a')
    handle:close()
    if cmd == '' then
        map("n", "<c-p>", ":lua require('telescope.builtin').find_files{}<CR>", opts)
    else
        map("n", "<c-p>", ":lua require('telescope.builtin').git_files{}<CR>", opts)
    end
end

set_fuzzy()

M.nvim_config = function()
    require("telescope.builtin").find_files({
        shorten_path = false,
        cwd = "~/.config/nvim",
        prompt = "DotFiles",
    })
end

M.buffers_list = function()
    require("telescope.builtin").buffers({
        attach_mappings = function(_, map)
            map('i', '<c-d>', actions.delete_buffer)
            map('n', '<c-d>', actions.delete_buffer)
            return true
        end
    })
end

local function refactor(prompt_bufnr)
    local content = require("telescope.actions.state").get_selected_entry(
        prompt_bufnr
    )
    require("telescope.actions").close(prompt_bufnr)
    require("refactoring").refactor(content.value)
end

M.refactors = function()
    local topts = require("telescope.themes").get_cursor()
    require("telescope.pickers").new(topts, {
        prompt_title = "refactors",
        finder = require("telescope.finders").new_table({
            results = require("refactoring").get_refactors(),
        }),
        sorter = require("telescope.config").values.generic_sorter(topts),
        attach_mappings = function(_, map)
            map("i", "<CR>", refactor)
            map("n", "<CR>", refactor)
            return true
        end
    }):find()
end

map("n", "<leader>tl", ":Telescope<CR>", opts)
map("n", "<leader>bf", ":lua require('nvim-plugin.telescope').buffers_list()<CR>", opts)
map("n", "<leader>rl", ":lua require('nvim-plugin.telescope').refactors()<CR>", opts)
map("v", "<leader>rl", ":lua require('nvim-plugin.telescope').refactors()<CR>", opts)
map("n", "<leader>ch", ":lua require('telescope.builtin').command_history{}<CR>", opts)
map("n", "<leader>of", ":lua require('telescope.builtin').oldfiles{}<CR>", opts)
map("n", "<leader>rg", ":lua require('telescope.builtin').live_grep{}<CR>", opts)
map("n", "<leader>tr", ":lua require('telescope.builtin').treesitter{}<CR>", opts)
map("n", "<leader>fw", ":lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>", opts)
map("n", "<leader>fg", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>", opts)
map("n", "<leader>ht", ":lua require('telescope.builtin').help_tags()<CR>", opts)
map("n", "<leader>gb", ":lua require('telescope.builtin').git_branches()<CR>", opts)
map("n", "<leader>gw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", opts)
map("n", "<leader>df", ":lua require('nvim-plugin.telescope').nvim_config()<CR>", opts)
map("n", "<leader>sl", ":lua require('session-lens').search_session()<CR>", opts)
map("n", "<leader>m", ":lua require('telescope').extensions.telescope_makefile.telescope_makefile()<CR>", opts)
map("n", "<leader>d", ":lua require('telescope-doc').open_path({cwd = '$HOME/files/ext/shared/pdf/'})<CR>", opts)

return M
