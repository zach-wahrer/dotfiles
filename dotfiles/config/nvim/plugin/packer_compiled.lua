-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/zach/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/zach/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/zach/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/zach/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/zach/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["YankAssassin.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/YankAssassin.vim",
    url = "https://github.com/svban/YankAssassin.vim"
  },
  ["bookmarks.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.bookmarks\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/bookmarks.nvim",
    url = "https://github.com/crusj/bookmarks.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.bufferline\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cinnamon.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rcinnamon\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/cinnamon.nvim",
    url = "https://github.com/declancm/cinnamon.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["dial.nvim"] = {
    config = { "\27LJ\2\n,\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\17plugins.dial\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/dial.nvim",
    url = "https://github.com/monaqa/dial.nvim"
  },
  ["diffview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["dir-telescope.nvim"] = {
    config = { "\27LJ\2\n]\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\vhidden\2\22respect_gitignore\2\nsetup\18dir-telescope\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/dir-telescope.nvim",
    url = "https://github.com/princejoogie/dir-telescope.nvim"
  },
  ["editorconfig.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/editorconfig.nvim",
    url = "https://github.com/gpanders/editorconfig.nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.friendly_snippets\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git-messenger.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/git-messenger.vim",
    url = "https://github.com/rhysd/git-messenger.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gotests-vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/gotests-vim",
    url = "https://github.com/buoto/gotests-vim"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/guihua.lua",
    url = "https://github.com/ray-x/guihua.lua"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  jester = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/jester",
    url = "https://github.com/David-Kunz/jester"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.lualine\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["matchparen.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15matchparen\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/matchparen.nvim",
    url = "https://github.com/monkoose/matchparen.nvim"
  },
  ["mini.nvim"] = {
    config = { "\27LJ\2\n½\1\0\0\3\0\a\0\0206\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0B\0\1\0016\0\0\0'\2\6\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\18mini.surround\nsetup\15mini.pairs\29plugins.mini_indentscope\25plugins.mini_comment\21plugins.mini_map\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["modes.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.modes\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/modes.nvim",
    url = "https://github.com/mvllow/modes.nvim"
  },
  ["neo-tree.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.neo_tree\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neodim = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.neodim\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/neodim",
    url = "https://github.com/zbirenbaum/neodim"
  },
  neogen = {
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\19snippet_engine\fluasnip\nsetup\vneogen\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/neogen",
    url = "https://github.com/danymat/neogen"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.noice\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.null_ls\frequire\0" },
    load_after = {
      ["prettier.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-bqf"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.nvm_cmp\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-code-action-menu"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-code-action-menu",
    url = "https://github.com/weilbith/nvim-code-action-menu"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.colorizer\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/NvChad/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.dap\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-go"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vdap-go\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/nvim-dap-go",
    url = "https://github.com/leoluz/nvim-dap-go"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.dap_ui\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    config = { "\27LJ\2\nC\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\26nvim-dap-virtual-text\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-hlslens"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fhlslens\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-kitty-navigator"] = {
    config = { "\27LJ\2\nF\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\25nvim-kitty-navigator\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-kitty-navigator",
    url = "https://github.com/hermitmaster/nvim-kitty-navigator"
  },
  ["nvim-lastplace"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-lastplace",
    url = "https://github.com/ethanholz/nvim-lastplace"
  },
  ["nvim-lint"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.nvim_lint\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/nvim-lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.lsp\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textsubjects"] = {
    config = { "\27LJ\2\n?\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0$plugins.treesitter_textsubjects\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.window_picker\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["onedark.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup-menu.nvim"] = {
    load_after = {
      ["spelunker.vim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/popup-menu.nvim",
    url = "https://github.com/kamykn/popup-menu.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["prettier.nvim"] = {
    after = { "null-ls.nvim" },
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.prettier\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/prettier.nvim",
    url = "https://github.com/MunifTanjim/prettier.nvim"
  },
  rainbow_csv = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/rainbow_csv",
    url = "https://github.com/mechatroner/rainbow_csv"
  },
  ["registers.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14registers\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ["sad.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tdiff\18diff-so-fancy\nsetup\bsad\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/sad.nvim",
    url = "https://github.com/ray-x/sad.nvim"
  },
  ["scope.nvim"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nscope\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/scope.nvim",
    url = "https://github.com/tiagovla/scope.nvim"
  },
  ["spellsitter.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16spellsitter\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/spellsitter.nvim",
    url = "https://github.com/lewis6991/spellsitter.nvim"
  },
  ["spelunker.vim"] = {
    after = { "popup-menu.nvim" },
    after_files = { "/home/zach/.local/share/nvim/site/pack/packer/opt/spelunker.vim/after/plugin/ctrlp/spelunker.vim" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.spelunker\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/spelunker.vim",
    url = "https://github.com/kamykn/spelunker.vim"
  },
  ["stylua-nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/stylua-nvim",
    url = "https://github.com/ckipp01/stylua-nvim"
  },
  ["svart.nvim"] = {
    config = { "\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.svart\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/svart.nvim",
    url = "https://gitlab.com/madyanov/svart.nvim"
  },
  ["tabout.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vtabout\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/tabout.nvim",
    url = "https://github.com/abecodes/tabout.nvim"
  },
  ["telescope-env.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/telescope-env.nvim",
    url = "https://github.com/LinArcX/telescope-env.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-luasnip.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/telescope-luasnip.nvim",
    url = "https://github.com/benfowler/telescope-luasnip.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/telescope-packer.nvim",
    url = "https://github.com/nvim-telescope/telescope-packer.nvim"
  },
  ["telescope-zoxide"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/telescope-zoxide",
    url = "https://github.com/jvgrootveld/telescope-zoxide"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.todo_comments\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["undofile_warn.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/undofile_warn.vim",
    url = "https://github.com/arp242/undofile_warn.vim"
  },
  ["vim-bbye"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/vim-bbye",
    url = "https://github.com/moll/vim-bbye"
  },
  ["vim-delve"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/vim-delve",
    url = "https://github.com/sebdah/vim-delve"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-go"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19plugins.vim_go\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/vim-go",
    url = "https://github.com/fatih/vim-go"
  },
  ["vim-illuminate"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.vim_illuminate\frequire\0" },
    loaded = true,
    path = "/home/zach/.local/share/nvim/site/pack/packer/start/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-kitty"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/vim-kitty",
    url = "https://github.com/fladson/vim-kitty"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.vim_test\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/zach/.local/share/nvim/site/pack/packer/opt/vim-test",
    url = "https://github.com/vim-test/vim-test"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Config for: nvim-hlslens
time([[Config for nvim-hlslens]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fhlslens\frequire\0", "config", "nvim-hlslens")
time([[Config for nvim-hlslens]], false)
-- Config for: scope.nvim
time([[Config for scope.nvim]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\nscope\frequire\0", "config", "scope.nvim")
time([[Config for scope.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-window-picker
time([[Config for nvim-window-picker]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.window_picker\frequire\0", "config", "nvim-window-picker")
time([[Config for nvim-window-picker]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
try_loadstring("\27LJ\2\n½\1\0\0\3\0\a\0\0206\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0B\0\1\0016\0\0\0'\2\6\0B\0\2\0029\0\5\0B\0\1\1K\0\1\0\18mini.surround\nsetup\15mini.pairs\29plugins.mini_indentscope\25plugins.mini_comment\21plugins.mini_map\frequire\0", "config", "mini.nvim")
time([[Config for mini.nvim]], false)
-- Config for: cinnamon.nvim
time([[Config for cinnamon.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rcinnamon\frequire\0", "config", "cinnamon.nvim")
time([[Config for cinnamon.nvim]], false)
-- Config for: modes.nvim
time([[Config for modes.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.modes\frequire\0", "config", "modes.nvim")
time([[Config for modes.nvim]], false)
-- Config for: nvim-treesitter-textsubjects
time([[Config for nvim-treesitter-textsubjects]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0$plugins.treesitter_textsubjects\frequire\0", "config", "nvim-treesitter-textsubjects")
time([[Config for nvim-treesitter-textsubjects]], false)
-- Config for: neo-tree.nvim
time([[Config for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21plugins.neo_tree\frequire\0", "config", "neo-tree.nvim")
time([[Config for neo-tree.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-kitty-navigator
time([[Config for nvim-kitty-navigator]], true)
try_loadstring("\27LJ\2\nF\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\25nvim-kitty-navigator\frequire\0", "config", "nvim-kitty-navigator")
time([[Config for nvim-kitty-navigator]], false)
-- Config for: svart.nvim
time([[Config for svart.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.svart\frequire\0", "config", "svart.nvim")
time([[Config for svart.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n+\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\16plugins.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26plugins.todo_comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.nvm_cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: noice.nvim
time([[Config for noice.nvim]], true)
try_loadstring("\27LJ\2\n-\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\18plugins.noice\frequire\0", "config", "noice.nvim")
time([[Config for noice.nvim]], false)
-- Config for: friendly-snippets
time([[Config for friendly-snippets]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30plugins.friendly_snippets\frequire\0", "config", "friendly-snippets")
time([[Config for friendly-snippets]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23plugins.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20plugins.lualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: matchparen.nvim
time([[Config for matchparen.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15matchparen\frequire\0", "config", "matchparen.nvim")
time([[Config for matchparen.nvim]], false)
-- Config for: nvim-lastplace
time([[Config for nvim-lastplace]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-lastplace\frequire\0", "config", "nvim-lastplace")
time([[Config for nvim-lastplace]], false)
-- Config for: vim-illuminate
time([[Config for vim-illuminate]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27plugins.vim_illuminate\frequire\0", "config", "vim-illuminate")
time([[Config for vim-illuminate]], false)
-- Config for: sad.nvim
time([[Config for sad.nvim]], true)
try_loadstring("\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tdiff\18diff-so-fancy\nsetup\bsad\frequire\0", "config", "sad.nvim")
time([[Config for sad.nvim]], false)
-- Config for: bookmarks.nvim
time([[Config for bookmarks.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22plugins.bookmarks\frequire\0", "config", "bookmarks.nvim")
time([[Config for bookmarks.nvim]], false)
-- Config for: dir-telescope.nvim
time([[Config for dir-telescope.nvim]], true)
try_loadstring("\27LJ\2\n]\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\vhidden\2\22respect_gitignore\2\nsetup\18dir-telescope\frequire\0", "config", "dir-telescope.nvim")
time([[Config for dir-telescope.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType session ++once lua require("packer.load")({'vim-kitty'}, { ft = "session" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'stylua-nvim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType mod ++once lua require("packer.load")({'vim-go'}, { ft = "mod" }, _G.packer_plugins)]]
vim.cmd [[au FileType csv ++once lua require("packer.load")({'rainbow_csv'}, { ft = "csv" }, _G.packer_plugins)]]
vim.cmd [[au FileType md ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "md" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'gotests-vim', 'vim-go', 'nvim-dap-go', 'vim-delve'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType conf ++once lua require("packer.load")({'vim-kitty'}, { ft = "conf" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-lint', 'YankAssassin.vim', 'neogen', 'git-messenger.vim', 'gitsigns.nvim', 'spelunker.vim', 'undofile_warn.vim', 'dial.nvim', 'registers.nvim', 'diffview.nvim', 'spellsitter.nvim', 'tabout.nvim', 'prettier.nvim', 'neodim', 'nvim-ts-autotag', 'jester', 'nvim-dap', 'nvim-dap-virtual-text', 'nvim-dap-ui', 'vim-test'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/zach/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], true)
vim.cmd [[source /home/zach/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]]
time([[Sourcing ftdetect script at: /home/zach/.local/share/nvim/site/pack/packer/opt/vim-go/ftdetect/gofiletype.vim]], false)
time([[Sourcing ftdetect script at: /home/zach/.local/share/nvim/site/pack/packer/opt/vim-kitty/ftdetect/kitty.vim]], true)
vim.cmd [[source /home/zach/.local/share/nvim/site/pack/packer/opt/vim-kitty/ftdetect/kitty.vim]]
time([[Sourcing ftdetect script at: /home/zach/.local/share/nvim/site/pack/packer/opt/vim-kitty/ftdetect/kitty.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
