" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time("Luarocks path setup", true)
local package_path_str = "/home/tony/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/tony/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/tony/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/tony/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/tony/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time("Luarocks path setup", false)
time("try_loadstring definition", true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time("try_loadstring definition", false)
time("Defining packer_plugins", true)
_G.packer_plugins = {
  ["DAPInstall.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\b\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0'\3\4\0004\4\0\0B\1\3\0019\1\3\0'\3\5\0004\4\0\0B\1\3\0019\1\3\0'\3\6\0004\4\0\0B\1\3\0019\1\3\0'\3\a\0004\4\0\0B\1\3\1K\0\1\0\15python_dbg\flua_dbg\15jsnode_dbg\19ccppr_lldb_dbg\vconfig\nsetup\16dap-install\frequire\0" },
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/DAPInstall.nvim"
  },
  ["FTerm.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nFTerm\frequire\0" },
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/FTerm.nvim"
  },
  ["auto-session"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["cheat.sh-vim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/cheat.sh-vim"
  },
  ["completion-nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/completion-nvim"
  },
  ["contextprint.nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/contextprint.nvim"
  },
  ["git-worktree.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17git-worktree\frequire\0" },
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/git-worktree.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lsp-trouble.nvim"] = {
    config = { "\27LJ\2\n~\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nsigns\1\0\0\1\0\4\fwarning\t⚠ \nerror\b❌\thint\t💡\16information\b\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/lsp-trouble.nvim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27nvim-plugin.statusline\frequire\0" },
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["monolithic.nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/monolithic.nvim"
  },
  ["nabla.nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/nabla.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-base16"] = {
    config = { "\27LJ\2\nE\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\28nvim-plugin.colorscheme\frequire\0" },
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/nvim-base16"
  },
  ["nvim-blame-line"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/nvim-blame-line"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nX\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\bcss\1\0\1\vrgb_fn\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20nvim-plugin.lsp\frequire\0" },
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26nvim-plugin.nvim_tree\frequire\0" },
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\17query_linter\16lint_events\1\3\0\0\rBufWrite\15CursorHold\1\0\2\venable\2\21use_virtual_text\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["session-lens"] = {
    config = { "\27LJ\2\np\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\14previewer\1\17shorten_path\1\17prompt_title\rSessions\nsetup\17session-lens\frequire\0" },
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/session-lens"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["telescope-cheat.nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/telescope-cheat.nvim"
  },
  ["telescope-doc.nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/telescope-doc.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26nvim-plugin.telescope\frequire\0" },
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ultisnips = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/ultisnips"
  },
  undotree = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/undotree"
  },
  ["venn.nvim"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/venn.nvim"
  },
  ["vim-bujo"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21nvim-plugin.bujo\frequire\0" },
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/vim-bujo"
  },
  ["vim-cpp-enhanced-highlight"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/vim-cpp-enhanced-highlight"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-fugitive"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25nvim-plugin.fugitive\frequire\0" },
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/vim-projectionist"
  },
  ["vim-rfc"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/vim-rfc"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/vim-snippets"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-startuptime"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  vimagit = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/vimagit"
  },
  vimwiki = {
    loaded = true,
    path = "/home/tony/.local/share/nvim/site/pack/packer/start/vimwiki"
  }
}

time("Defining packer_plugins", false)
-- Config for: nvim-lspconfig
time("Config for nvim-lspconfig", true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20nvim-plugin.lsp\frequire\0", "config", "nvim-lspconfig")
time("Config for nvim-lspconfig", false)
-- Config for: vim-fugitive
time("Config for vim-fugitive", true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25nvim-plugin.fugitive\frequire\0", "config", "vim-fugitive")
time("Config for vim-fugitive", false)
-- Config for: vim-bujo
time("Config for vim-bujo", true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21nvim-plugin.bujo\frequire\0", "config", "vim-bujo")
time("Config for vim-bujo", false)
-- Config for: nvim-treesitter
time("Config for nvim-treesitter", true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0005\4\t\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\17query_linter\16lint_events\1\3\0\0\rBufWrite\15CursorHold\1\0\2\venable\2\21use_virtual_text\2\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time("Config for nvim-treesitter", false)
-- Config for: FTerm.nvim
time("Config for FTerm.nvim", true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nFTerm\frequire\0", "config", "FTerm.nvim")
time("Config for FTerm.nvim", false)
-- Config for: nvim-tree.lua
time("Config for nvim-tree.lua", true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26nvim-plugin.nvim_tree\frequire\0", "config", "nvim-tree.lua")
time("Config for nvim-tree.lua", false)
-- Config for: lualine.nvim
time("Config for lualine.nvim", true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27nvim-plugin.statusline\frequire\0", "config", "lualine.nvim")
time("Config for lualine.nvim", false)
-- Config for: session-lens
time("Config for session-lens", true)
try_loadstring("\27LJ\2\np\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\3\14previewer\1\17shorten_path\1\17prompt_title\rSessions\nsetup\17session-lens\frequire\0", "config", "session-lens")
time("Config for session-lens", false)
-- Config for: nvim-colorizer.lua
time("Config for nvim-colorizer.lua", true)
try_loadstring("\27LJ\2\nX\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\bcss\1\0\1\vrgb_fn\2\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time("Config for nvim-colorizer.lua", false)
-- Config for: telescope.nvim
time("Config for telescope.nvim", true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26nvim-plugin.telescope\frequire\0", "config", "telescope.nvim")
time("Config for telescope.nvim", false)
-- Config for: DAPInstall.nvim
time("Config for DAPInstall.nvim", true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\b\0\0226\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0'\3\4\0004\4\0\0B\1\3\0019\1\3\0'\3\5\0004\4\0\0B\1\3\0019\1\3\0'\3\6\0004\4\0\0B\1\3\0019\1\3\0'\3\a\0004\4\0\0B\1\3\1K\0\1\0\15python_dbg\flua_dbg\15jsnode_dbg\19ccppr_lldb_dbg\vconfig\nsetup\16dap-install\frequire\0", "config", "DAPInstall.nvim")
time("Config for DAPInstall.nvim", false)
-- Config for: lsp-trouble.nvim
time("Config for lsp-trouble.nvim", true)
try_loadstring("\27LJ\2\n~\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\nsigns\1\0\0\1\0\4\fwarning\t⚠ \nerror\b❌\thint\t💡\16information\b\nsetup\ftrouble\frequire\0", "config", "lsp-trouble.nvim")
time("Config for lsp-trouble.nvim", false)
-- Config for: nvim-base16
time("Config for nvim-base16", true)
try_loadstring("\27LJ\2\nE\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\28nvim-plugin.colorscheme\frequire\0", "config", "nvim-base16")
time("Config for nvim-base16", false)
-- Config for: git-worktree.nvim
time("Config for git-worktree.nvim", true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17git-worktree\frequire\0", "config", "git-worktree.nvim")
time("Config for git-worktree.nvim", false)
if should_profile then save_profiles() end

END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry