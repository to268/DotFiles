local cmp = require('cmp')
local luasnip = require("luasnip")
local snippets = require('nvim-plugin.snippets')

local M = {}

local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = ""
}

M.setup = function()
    cmp.setup {
        snippet = {
            expand = function(args)
                require'luasnip'.lsp_expand(args.body)
            end
        },

        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'cmp_git' },
            }, {
                    { name = 'buffer' },
                })
        }),

        cmp.setup.cmdline('/', {
            sources = cmp.config.sources({
                { name = 'nvim_lsp_document_symbol' }
            }, {
                { name = 'buffer' }
            })
        }),
        cmp.setup.cmdline(':', {
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline', keyword_length = 4 }
            })
        }),

        sources = {
            -- { name = 'cmp_tabnine' },
            { name = 'luasnip' },
            { name = 'nvim_lsp' },
            { name = 'calc' },
            { name = "crates" },
            { name = 'nvim_lua' },
            { name = 'path', priority = 2 },
            { name = 'spell' },
            { name = 'vsnip' },
            { name = 'tags' },
            -- { name = 'buffer', priority = 2 },
            -- { name = 'rg', priority = 2 },
            -- { name = 'treesitter', priority = 2 },
            { name = 'latex_symbols', priority = 2 },
        },

        mapping = {
            ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            ['<C-y>'] = cmp.config.disable,
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { "i", "s" }),
        },

        formatting = {
            format = function(entry, vim_item)
                vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)

                vim_item.menu = ({
                    buffer = "[Buffer]",
                    calc = "[Calc]",
                    cmp_git = "[Git]",
                    cmp_tabnine = "[TabNine]",
                    crates = "[Crates]",
                    latex_symbols = "[Latex]",
                    luasnip = "[LuaSnip]",
                    nvim_lsp = "[LSP]",
                    nvim_lua = "[Lua]",
                    path = "[Path]",
                    rg = "[RG]",
                    spell = "[Spell]",
                    tags = "[Tags]",
                    treesitter = "[Treesitter]",
                    vsnip = "[Vsnip]",
                })[entry.source.name]
                return vim_item
            end,
        },

        sorting = {
            comparators = {
                cmp.config.compare.offset,
                cmp.config.compare.exact,
                cmp.config.compare.sort_text,
                cmp.config.compare.score,
                require "cmp-under-comparator".under,
                cmp.config.compare.kind,
                cmp.config.compare.length,
                cmp.config.compare.order,
            },
        }
    }
end

return M
