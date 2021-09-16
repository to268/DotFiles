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
            { name = 'path' },
            { name = 'spell' },
            { name = 'vsnip' },
            { name = 'tags' },
            -- { name = 'latex_symbols' },
            -- { name = 'treesitter' },
            -- { name = 'buffer' },
        },
        mapping = {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ["<Tab>"] = cmp.mapping(function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-n>", true, true, true), "n")
                elseif luasnip.expand_or_jumpable() then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                elseif snippets.check_back_space() then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<tab>", true, true, true), "n")
                else
                    fallback()
                end
            end, {
                    "i",
                    "s",
                }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if vim.fn.pumvisible() == 1 then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-p>", true, true, true), "n")
                elseif luasnip.jumpable(-1) then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                else
                    fallback()
                end
            end, {
                    "i",
                    "s",
                }),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            })
        },
        formatting = {
            format = function(entry, vim_item)
                -- fancy icons and a name of kind
                if vim_item.kind == "Field" or vim_item.kind == "Property" then
                    vim_item.kind = '' .. " " .. vim_item.kind
                else

                    vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind
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
                    -- treesitter = "[Treesitter]",
                    vsnip = "[Vsnip]",
                })[entry.source.name]
                return vim_item
            end,
        },
    }
end

return M
