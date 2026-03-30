local MiniStatusline = require("mini.statusline")

MiniStatusline.setup({
  -- Content of statusline as functions which return statusline string. See
  -- `:h statusline` and code of default contents (used instead of `nil`).
  content = {
    -- Content for active window
    active = function()
        local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 12 })
        local git           = MiniStatusline.section_git({ trunc_width = 40 })
        local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
        local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
        local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
        local filename      = MiniStatusline.section_filename({ trunc_width = 3840 })
        local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
        local location      = MiniStatusline.section_location({ trunc_width = 75 })
        local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

        return MiniStatusline.combine_groups({
          { hl = mode_hl,                  strings = { mode } },
          { hl = 'MiniStatuslineDevinfo',  strings = { git, diff, diagnostics, lsp } },
          '%<', -- Mark general truncate point
          { hl = 'MiniStatuslineFilename', strings = { filename } },
          '%=', -- End left alignment
          { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
          { hl = mode_hl,                  strings = { search, location } },
        })
    end,
    -- Content for inactive window(s) (does not exists since the status bar is shared between buffers)
    inactive = nil,
  },

  -- Whether to use icons by default
  use_icons = true,
})
