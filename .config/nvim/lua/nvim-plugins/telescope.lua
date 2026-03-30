local map = vim.keymap.set
local opts = { noremap = true, silent = true }
local autocmd = vim.api.nvim_create_autocmd

vim.pack.add({
    {
        src = "https://www.github.com/nvim-telescope/telescope.nvim",
        version = vim.version.range("0.2.*"),
    },
    "https://github.com/nvim-telescope/telescope-ui-select.nvim",
    "https://github.com/nvim-telescope/telescope-fzf-native.nvim",
    "https://github.com/to268/telescope-doc.nvim",
})

autocmd('PackChanged', {
    callback = function(event)
        if event.data.kind == 'update' and event.data.spec.name == 'telescope-fzf-native.nvim' then
            vim.notify('telescope-fzf-native.nvim updated, running make...', vim.log.levels.INFO)
            vim.system({ 'make' }, { cwd = ev.data.path })
        end
    end,
})

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')
local previewers = require('telescope.previewers')

require('telescope').setup({
    defaults = {
        prompt_prefix = ' ',
        color_devicons = true,

        file_previewer   = previewers.vim_buffer_cat.new,
        grep_previewer   = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,

        mappings = {
            i = {
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
        fzf = {},
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
        },
    }
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

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
