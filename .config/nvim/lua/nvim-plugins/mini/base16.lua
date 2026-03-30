local NONE = 'NONE'
local BOLD = 'bold'

local hi = setmetatable({}, {
    __newindex = function(_, hlgroup, args)
        local guifg, guibg, gui, guisp = args.guifg, args.guibg, args.gui, args.guisp
        local cmd = { 'hi', hlgroup }
        if guifg then table.insert(cmd, 'guifg=' .. guifg) end
        if guibg then table.insert(cmd, 'guibg=' .. guibg) end
        if gui then table.insert(cmd, 'gui=' .. gui) end
        if guisp then table.insert(cmd, 'guisp=' .. guisp) end
        vim.cmd(table.concat(cmd, ' '))
    end
})

local colors = {
    base00 = '#282828', base01 = '#3c3836', base02 = '#504945', base03 = '#928374',
    base04 = '#bdae93', base05 = '#d5c4a1', base06 = '#ebdbb2', base07 = '#fbf1c7',
    base08 = '#fb4934', base09 = '#fe8019', base0A = '#fabd2f', base0B = '#b8bb26',
    base0C = '#8ec07c', base0D = '#83a598', base0E = '#d3869b', base0F = '#d65d0e',
}

require('mini.base16').setup({
    palette = colors,
    use_cterm = true,
    plugins = {
        default = true,
    },
})

-- Transparent
hi.ColorColumn                  = { guibg = NONE }
hi.CursorLineNr                 = { guibg = NONE }
hi.LineNr                       = { guibg = NONE }
hi.LineNrAbove                  = { guibg = NONE }
hi.LineNrBelow                  = { guibg = NONE }
hi.Normal                       = { guibg = NONE }
hi.NormalFloat                  = { guibg = NONE }
hi.NormalNC                     = { guibg = NONE }
hi.SignColumn                   = { guibg = NONE }
hi.WinSeparator                 = { guibg = NONE }

-- Default groups
hi.Character                    = { guifg = colors.base0C, guibg = nil, gui = NONE, guisp = nil }
hi.Conditional                  = { guifg = colors.base08, guibg = nil, gui = NONE, guisp = nil }
hi.Define                       = { guifg = colors.base0D, guibg = nil, gui = NONE, guisp = nil }
hi.Function                     = { guifg = colors.base0B, guibg = nil, gui = BOLD, guisp = nil }
hi.Identifier                   = { guifg = colors.base0D, guibg = nil, gui = NONE, guisp = nil }
hi.Keyword                      = { guifg = colors.base08, guibg = nil, gui = NONE, guisp = nil }
hi.Label                        = { guifg = colors.base09, guibg = nil, gui = NONE, guisp = nil }
hi.Macro                        = { guifg = colors.base09, guibg = nil, gui = NONE, guisp = nil }
hi.Number                       = { guifg = colors.base0E, guibg = nil, gui = NONE, guisp = nil }
hi.PreCondit                    = { guifg = colors.base08, guibg = nil, gui = NONE, guisp = nil }
hi.PreProc                      = { guifg = colors.base0D, guibg = nil, gui = NONE, guisp = nil }
hi.Repeat                       = { guifg = colors.base08, guibg = nil, gui = NONE, guisp = nil }
hi.Special                      = { guifg = colors.base09, guibg = nil, gui = NONE, guisp = nil }
hi.SpecialChar                  = { guifg = colors.base09, guibg = nil, gui = NONE, guisp = nil }
hi.Statement                    = { guifg = colors.base08, guibg = nil, gui = NONE, guisp = nil }
hi.StorageClass                 = { guifg = colors.base08, guibg = nil, gui = NONE, guisp = nil }
hi.Structure                    = { guifg = colors.base0C, guibg = nil, gui = NONE, guisp = nil }
hi.Tag                          = { guifg = colors.base0C, guibg = nil, gui = NONE, guisp = nil }
hi.Typedef                      = { guifg = colors.base08, guibg = nil, gui = NONE, guisp = nil }
hi.TabLine                      = { guifg = colors.base05, guibg = colors.base02, gui = NONE, guisp = nil }

-- Treesitter
hi.TreesitterContext = { guifg = NONE, guibg = colors.base01, gui = NONE, guisp = nil }

hi.TSClass                      = { guifg = colors.base08, guibg = nil, gui = NONE, guisp = nil }
hi.TSFuncMacro                  = { guifg = colors.base09, guibg = nil, gui = NONE, guisp = nil }
hi.TSFunction                   = { guifg = colors.base0B, guibg = nil, gui = BOLD, guisp = nil }
hi.TSInclude                    = { guifg = colors.base0C, guibg = nil, gui = NONE, guisp = nil }
hi.TSKeyword                    = { guifg = colors.base08, guibg = nil, gui = NONE, guisp = nil }
hi.TSOperator                   = { guifg = colors.base0E, guibg = nil, gui = NONE, guisp = nil }
hi.TSType                       = { guifg = colors.base0A, guibg = nil, gui = NONE, guisp = nil }
hi.TSTypeQualifier              = { guifg = colors.base08, guibg = nil, gui = NONE, guisp = nil }
hi.TSVariable                   = { guifg = colors.base0D, guibg = nil, gui = NONE, guisp = nil }

vim.cmd [[hi! link @operator TSOperator]]
vim.cmd [[hi! link @type TSType]]
vim.cmd [[hi! link @lass TSClass]]
vim.cmd [[hi! link @type.qualifier TSTypeQualifier]]
vim.cmd [[hi! link @variable TSVariable]]

vim.cmd [[hi! link @keyword.import.cpp TSInclude]]

vim.cmd [[hi! link @lsp.type.class @class]]
vim.cmd [[hi! link @lsp.type.enum @type]]
vim.cmd [[hi! link @lsp.type.namespace @type]]
vim.cmd [[hi! link @lsp.type.operator @operator]]
vim.cmd [[hi! link @lsp.type.variable @variable]]
vim.cmd [[hi! link @lsp.type.struct @type]]

-- Cmp
hi.CmpItemAbbrMatch             = { guifg = colors.base09, guibg = nil, gui = NONE, guisp = nil }
hi.CmpItemAbbrMatchFuzzy        = { guifg = colors.base0F, guibg = nil, gui = NONE, guisp = nil }
hi.CmpItemKind                  = { guifg = colors.base05, guibg = nil, gui = NONE, guisp = nil }

-- Telescope
hi.TelescopeBorder              = { guifg = colors.base02, guibg = NONE, gui = NONE, guisp = nil }
hi.TelescopeMultiSelection      = { guifg = colors.base0E, guibg = NONE, gui = NONE, guisp = nil }
hi.TelescopeNormal              = { guifg = NONE, guibg = NONE, gui = NONE, guisp = nil }
hi.TelescopePreviewTitle        = { guifg = NONE, guibg = colors.base08, gui = NONE, guisp = nil }
hi.TelescopePromptTitle         = { guifg = NONE, guibg = colors.base0D, gui = NONE, guisp = nil }
hi.TelescopeResultsTitle        = { guifg = NONE, guibg = colors.base0B, gui = NONE, guisp = nil }
hi.TelescopeSelection           = { guifg = colors.base09, guibg = NONE, gui = NONE, guisp = nil }
hi.TelescopeTitle               = { guifg = NONE, guibg = colors.base0D, gui = NONE, guisp = nil }

-- Mini
hi.MiniHipatternsFixme          = { guifg = colors.base08, guibg = colors.base00, gui = BOLD, guisp = nil }
hi.MiniHipatternsHack           = { guifg = colors.base0E, guibg = colors.base00, gui = BOLD, guisp = nil }
hi.MiniHipatternsNote           = { guifg = colors.base0D, guibg = colors.base00, gui = BOLD, guisp = nil }
hi.MiniHipatternsTodo           = { guifg = colors.base0A, guibg = colors.base00, gui = BOLD, guisp = nil }
hi.MiniStatuslineDevInfo        = { guifg = colors.base06, guibg = colors.base02, gui = NONE, guisp = nil }
hi.MiniStatuslineFilename       = { guifg = colors.base06, guibg = colors.base01, gui = NONE, guisp = nil }
hi.MiniStatuslineModeNormal     = { guifg = colors.base00, guibg = colors.base0C, gui = BOLD, guisp = nil }
hi.MiniStatuslineModeVisual     = { guifg = colors.base00, guibg = colors.base0E, gui = BOLD, guisp = nil }

-- Hightlight colors and special keywords
local hipatterns = require('mini.hipatterns')
local hi_words = require('mini.extra').gen_highlighter.words
hipatterns.setup({
    highlighters = {
        fixme = hi_words({ 'FIXME', 'Fixme', 'fixme' }, 'MiniHipatternsFixme'),
        hack = hi_words({ 'HACK', 'Hack', 'hack' }, 'MiniHipatternsHack'),
        todo = hi_words({ 'TODO', 'Todo', 'todo' }, 'MiniHipatternsTodo'),
        note = hi_words({ 'NOTE', 'Note', 'note' }, 'MiniHipatternsNote'),

        hex_color = hipatterns.gen_highlighter.hex_color(),
    },
})
