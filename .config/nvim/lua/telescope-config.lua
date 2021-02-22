local actions = require('telescope.actions')

local function setup()
    require('telescope').setup {
        defaults = {
            file_sorter = require('telescope.sorters').get_fzy_sorter,
            prompt_prefix = ' >',
            color_devicons = true,

            mappings = {
                i = {
                    ["<C-x>"] = false,
                    ["<C-s>"] = actions.select_default:replace(goto_file_selection_split),
                    ["<C-q>"] = actions.select_default:replace(send_to_qflist),
                },
            }
        }
    }
end

return {
    setup = setup
}
