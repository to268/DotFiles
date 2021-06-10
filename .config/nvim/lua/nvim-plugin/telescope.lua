local actions = require('telescope.actions')
local map = vim.api.nvim_set_keymap

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
                ["C-x"] = false,
                ["C-s"] = actions.select_default:replace(goto_file_selection_split),
                ["C-q"] = actions.select_default:replace(send_to_qflist),
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('session-lens')
require('telescope').load_extension('git_worktree')
require('telescope').load_extension('frecency')
require('telescope').load_extension('cheat')

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


map("n", "<leader>tl", ":Telescope<CR>", opts)
map("n", "<leader>bf", ":lua require('telescope.builtin').buffers{}<CR>", opts)
map("n", "<leader>ch", ":lua require('telescope.builtin').command_history{}<CR>", opts)
map("n", "<leader>of", ":lua require('telescope.builtin').oldfiles{}<CR>", opts)
map("n", "<leader>rg", ":lua require('telescope.builtin').live_grep{}<CR>", opts)
map("n", "<leader>tr", ":lua require('telescope.builtin').treesitter{}<CR>", opts)
map("n", "<leader>fw", ":lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>", opts)
map("n", "<leader>fg", ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<CR>", opts)
map("n", "<leader>ht", ":lua require('telescope.builtin').help_tags()<CR>", opts)
map("n", "<leader>gb", ":lua require('telescope.builtin').git_branches()<CR>", opts)
map("n", "<leader>gw", ":lua require('telescope').extensions.git_worktree.git_worktrees()<CR>", opts)
map("n", "<leader>pl", ":lua require('telescope').extensions.packer.plugins()<CR>", opts)
map("n", "<leader>p", ":lua require('telescope').extensions.frecency.frecency()<CR>", opts)
map("n", "<leader>sl", ":lua require('session-lens').search_session()<CR>", opts)
map("n", "<leader>d", ":lua require('telescope-doc').open_path({cwd = '$HOME/files/ext/shared/pdf/'})<CR>", opts)
