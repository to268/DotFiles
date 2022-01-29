local colorscheme = require('base16-colorscheme')
local NONE = 'NONE'

local M = {}

local hi = setmetatable({}, {
    __newindex = function(_, hlgroup, args)
        local guifg, guibg, gui, guisp = args.guifg, args.guibg, args.gui, args.guisp
        local cmd = {'hi', hlgroup}
        if guifg then table.insert(cmd, 'guifg='..guifg) end
        if guibg then table.insert(cmd, 'guibg='..guibg) end
        if gui then table.insert(cmd, 'gui='..gui) end
        if guisp then table.insert(cmd, 'guisp='..guisp) end
        vim.cmd(table.concat(cmd, ' '))
    end
})

local colors = {
    base00 = '#282828', base01 = '#3c3836', base02 = '#504945', base03 = '#928374',
    base04 = '#bdae93', base05 = '#d5c4a1', base06 = '#ebdbb2', base07 = '#fbf1c7',
    base08 = '#fb4934', base09 = '#fe8019', base0A = '#fabd2f', base0B = '#b8bb26',
    base0C = '#8ec07c', base0D = '#83a598', base0E = '#d3869b', base0F = '#d65d0e',
}

M.Gruvbox = function()
    for k in pairs(package.loaded) do if k:match("^colorscheme") then package.loaded[k] = nil end end
    colorscheme.setup({
        base00 = colors.base00, base01 = colors.base01, base02 = colors.base02, base03 = colors.base03,
        base04 = colors.base04, base05 = colors.base05, base06 = colors.base06, base07 = colors.base07,
        base08 = colors.base08, base09 = colors.base09, base0A = colors.base0A, base0B = colors.base0B,
        base0C = colors.base0C, base0D = colors.base0D, base0E = colors.base0E, base0F = colors.base0F,
    })

    hi.CursorLineNr = { guifg = colors.base0A, guibg = colors.base01,     gui = nil,              guisp = nil }
    hi.MoreMsg      = { guifg = colors.base0A, guibg = nil,               gui = nil,              guisp = nil }
    hi.ModeMsg      = { guifg = colors.base0A, guibg = nil,               gui = nil,              guisp = nil }
    hi.NormalFloat  = { guifg = nil,           guibg = colors.base02,     gui = NONE,             guisp = nil }
    hi.TabLine      = { guifg = colors.base05, guibg = colors.base02,     gui = NONE,             guisp = nil }
    hi.Directory    = { guifg = colors.base0B, guibg = nil,               gui = 'bold',           guisp = nil }
    hi.LineNr       = { guifg = colors.base03, guibg = colors.base00,     gui = nil,              guisp = nil }
    hi.SignColumn   = { guifg = colors.base04, guibg = colors.base01,     gui = nil,              guisp = nil }
    hi.Title        = { guifg = colors.base0E, guibg = colors.base00,     gui = nil,              guisp = nil }
    hi.VertSplit    = { guifg = colors.base02, guibg = colors.base00,     gui = nil,              guisp = nil }

    hi.Comment        = { guifg = colors.base03, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Constant       = { guifg = colors.base09, guibg = nil,             gui = NONE,             guisp = nil }
    hi.String         = { guifg = colors.base0B, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Character      = { guifg = colors.base0C, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Number         = { guifg = colors.base0E, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Boolean        = { guifg = colors.base09, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Float          = { guifg = colors.base09, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Identifier     = { guifg = colors.base0D, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Function       = { guifg = colors.base0B, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Statement      = { guifg = colors.base08, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Conditional    = { guifg = colors.base08, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Repeat         = { guifg = colors.base08, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Label          = { guifg = colors.base09, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Operator       = { guifg = colors.base05, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Keyword        = { guifg = colors.base09, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Exception      = { guifg = colors.base08, guibg = nil,             gui = NONE,             guisp = nil }
    hi.PreProc        = { guifg = colors.base0D, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Include        = { guifg = colors.base0D, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Define         = { guifg = colors.base0D, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Macro          = { guifg = colors.base09, guibg = nil,             gui = NONE,             guisp = nil }
    hi.PreCondit      = { guifg = colors.base08, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Type           = { guifg = colors.base0A, guibg = nil,             gui = NONE,             guisp = nil }
    hi.StorageClass   = { guifg = colors.base08, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Structure      = { guifg = colors.base0C, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Typedef        = { guifg = colors.base08, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Special        = { guifg = colors.base09, guibg = nil,             gui = NONE,             guisp = nil }
    hi.SpecialChar    = { guifg = colors.base09, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Tag            = { guifg = colors.base0A, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Delimiter      = { guifg = colors.base0F, guibg = nil,             gui = NONE,             guisp = nil }
    hi.SpecialComment = { guifg = colors.base0C, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Debug          = { guifg = colors.base08, guibg = nil,             gui = NONE,             guisp = nil }
    hi.Underlined     = { guifg = colors.base05, guibg = nil,             gui = 'bold,underline', guisp = nil }
    hi.Error          = { guifg = colors.base00, guibg = colors.base08,   gui = NONE,             guisp = nil }
    hi.Todo           = { guifg = colors.base0A, guibg = colors.base00,   gui = 'bold',           guisp = nil }

    hi.LspDiagnosticsDefaultWarning = { guifg = colors.base0A, guibg = nil, gui = NONE,           guisp = nil }

    hi.RFCType      = { guifg = colors.base09, guibg = nil,               gui = NONE,             guisp = nil }
    hi.RFCID        = { guifg = colors.base0B, guibg = nil,               gui = NONE,             guisp = nil }
    hi.RFCTitle     = { guifg = colors.base09, guibg = nil,               gui = NONE,             guisp = nil }
    hi.RFCDelim     = { guifg = colors.base09, guibg = nil,               gui = NONE,             guisp = nil }

    hi.TSAnnotation         = { guifg = colors.base0A, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSAttribute          = { guifg = colors.base0A, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSBoolean            = { guifg = colors.base09, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSCharacter          = { guifg = colors.base0C, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSComment            = { guifg = colors.base03, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSConstructor        = { guifg = colors.base0C, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSConditional        = { guifg = colors.base08, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSConstant           = { guifg = colors.base0E, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSConstBuiltin       = { guifg = colors.base09, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSConstMacro         = { guifg = colors.base09, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSError              = { guifg = colors.base05, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSException          = { guifg = colors.base08, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSField              = { guifg = colors.base0D, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSFloat              = { guifg = colors.base09, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSFunction           = { guifg = colors.base0B, guibg = nil, gui = 'bold',          guisp = nil }
    hi.TSFuncBuiltin        = { guifg = colors.base0C, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSFuncMacro          = { guifg = colors.base09, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSInclude            = { guifg = colors.base0C, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSKeyword            = { guifg = colors.base08, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSKeywordFunction    = { guifg = colors.base08, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSLabel              = { guifg = colors.base0E, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSMethodMacro        = { guifg = colors.base09, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSNamespace          = { guifg = colors.base08, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSNone               = { guifg = colors.base08, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSNumber             = { guifg = colors.base0E, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSOperator           = { guifg = colors.base0E, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSParameter          = { guifg = colors.base0D, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSParameterReference = { guifg = colors.base08, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSProperty           = { guifg = colors.base09, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSPunctDelimiter     = { guifg = colors.base0F, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSPunctBracket       = { guifg = colors.base09, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSPunctSpecial       = { guifg = colors.base0F, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSRepeat             = { guifg = colors.base08, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSString             = { guifg = colors.base0B, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSStringRegex        = { guifg = colors.base0B, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSStringEscape       = { guifg = colors.base0C, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSTag                = { guifg = colors.base0A, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSTagDelimiter       = { guifg = colors.base0F, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSText               = { guifg = colors.base05, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSStrong             = { guifg = nil,           guibg = nil, gui = 'bold',          guisp = nil }
    hi.TSEmphasis           = { guifg = colors.base09, guibg = nil, gui = 'italic',        guisp = nil }
    hi.TSUnderline          = { guifg = colors.base04, guibg = nil, gui = 'underline',     guisp = nil }
    hi.TSStrike             = { guifg = colors.base00, guibg = nil, gui = 'strikethrough', guisp = nil }
    hi.TSTitle              = { guifg = colors.base0D, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSLiteral            = { guifg = colors.base09, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSURI                = { guifg = colors.base09, guibg = nil, gui = 'underline',     guisp = nil }
    hi.TSType               = { guifg = colors.base0A, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSTypeBuiltin        = { guifg = colors.base08, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSVariable           = { guifg = colors.base0D, guibg = nil, gui = NONE,            guisp = nil }
    hi.TSVariableBuiltin    = { guifg = colors.base08, guibg = nil, gui = NONE,            guisp = nil }

    -- Lspsaga
    hi.LspFloatWinNormal    = { guifg = nil, guibg = colors.base02, gui = NONE,            guisp = nil }

    -- Lsp signature
    hi.LspSignatureActiveParameter = { guifg = colors.base09, guibg = nil, gui = NONE,     guisp = nil }


    -- Telescope
    hi.TelescopeBorder          = { guifg = colors.base01, guibg = NONE, gui = NONE,            guisp = nil }
    hi.TelescopeNormal          = { guifg = NONE, guibg = NONE, gui = NONE,                     guisp = nil }
    hi.TelescopeResultsTitle    = { guifg = NONE, guibg = colors.base0D, gui = NONE,            guisp = nil }
    hi.TelescopeSelection       = { guifg = colors.base0E, guibg = NONE, gui = NONE,            guisp = nil }
end

M.Transparent = function()
    hi.Normal               = { guibg = NONE }
    hi.NormalNC             = { guibg = NONE }
    hi.LineNr               = { guibg = NONE }
    hi.SignColumn           = { guibg = NONE }
    hi.CursorLineNr         = { guibg = NONE }
    hi.ColorColumn          = { guibg = NONE }
    hi.LspFloatWinNormal    = { guibg = NONE }
end

M.setup = function()
    local map_base = ":lua require('nvim-plugin.colorscheme')."
    local map = vim.api.nvim_set_keymap

    M.Gruvbox()
    map("n", "<leader>gv", map_base .. "Gruvbox()<CR>", { noremap = true, silent = true })
    map("n", "<leader>tsp", map_base .. "Transparent()<CR>", { noremap = true, silent = true })
end

return M
