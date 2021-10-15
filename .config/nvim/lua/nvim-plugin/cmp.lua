local cmp = require('cmp')
local compare = require("cmp.types")
local luasnip = require("luasnip")
local snippets = require('nvim-plugin.snippets')

local M = {}

M.setup = function()
    cmp.setup {
        snippet = {
            expand = function(args)
                require'luasnip'.lsp_expand(args.body)
            end
        },

        sources = {
            { name = 'luasnip' },
            { name = 'cmp_tabnine' },
            { name = 'nvim_lsp' },
            { name = 'calc' },
            { name = 'nvim_lua' },
            { name = 'path', priority = 2 },
            { name = 'spell' },
            { name = 'vsnip' },
            { name = 'tags' },
            { name = 'latex_symbols',  priority = 2 },
            { name = 'buffer', priority = 2 },
            { name = 'treesitter' },
        },
        mapping = {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ["<Tab>"] = function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif snippets.check_back_space() then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<tab>", true, true, true), "n")
                else
                    fallback()
                end
            end,
            ["<S-Tab>"] = function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end,
        },
        formatting = {
            format = function(entry, vim_item)
                -- Add tabnine like icon if it's an entry of tabnine
                local tabnine_icon = ''
                if entry.source.name == "cmp_tabnine" then
                    tabnine_icon = '❂ '
                end

                -- fancy icons and a name of kind
                if vim_item.kind == "Field" or vim_item.kind == "Property" then
                    vim_item.kind = tabnine_icon .. '' .. " " .. vim_item.kind
                else
                    vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. tabnine_icon .. vim_item.kind
                end

                -- set a name for each source
                vim_item.menu = ({
                    buffer = "[Buffer]",
                    calc = "[Calc]",
                    cmp_tabnine = "[TabNine]",
                    latex_symbols = "[Latex]",
                    luasnip = "[LuaSnip]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[Lua]",
                    path = "[Path]",
                    tags = "[Tags]",
                    spell = "[Spell]",
                    treesitter = "[Treesitter]",
                    vsnip = "[Vsnip]",
                })[entry.source.name]
                return vim_item
            end,
        },
    }
end

return M
