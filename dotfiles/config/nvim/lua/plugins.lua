local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	Packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

require("packer").startup(function(use)
	-- PACKER
	use("wbthomason/packer.nvim")

	-- OPTIMIZATION
	use("lewis6991/impatient.nvim")

	-- THEMES
	use("navarasu/onedark.nvim")
	-- use("Th3Whit3Wolf/one-nvim")
	-- use("marko-cerovac/material.nvim")
	-- use("yonlu/omni.vim")
	-- use("sainnhe/edge")
	-- use("PHSix/nvim-hybrid")
	-- use("olimorris/onedarkpro.nvim")
	-- use("rmehri01/onenord.nvim")

	-- LSP
	use("neovim/nvim-lspconfig")
	use("folke/lsp-colors.nvim")
	use("ray-x/lsp_signature.nvim") -- Show func signature
	use("arkav/lualine-lsp-progress") -- Show lsp progress in lualine

	-- INTERFACE
	use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } }) -- Status Bar
	use({ "akinsho/bufferline.nvim", tag = "v2.*", requires = "kyazdani42/nvim-web-devicons" }) -- Buffer management
	use("ahmedkhalf/project.nvim") -- Project management
	use({ "nvim-treesitter/nvim-treesitter" }) -- Treesitter
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } },
	}) -- Finder
	use("b3nj5m1n/kommentary") -- Comment
	use("windwp/nvim-autopairs") -- Auto pairs
	use({ "petertriho/nvim-scrollbar", requires = { "kevinhwang91/nvim-hlslens" } }) -- Scroll bar
	use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }) -- File browser
	use("p00f/nvim-ts-rainbow") -- Rainbow brackets
	use("mg979/vim-visual-multi") -- Multi cursors
	use("declancm/cinnamon.nvim") -- Smooth scrolling
	use("folke/trouble.nvim") -- Pretty list for diagnostics
	use("moll/vim-bbye") -- Better buffer quit
	use("abecodes/tabout.nvim") -- Tab out
	use("lewis6991/spellsitter.nvim") -- Spell check within treesitter
	use({ "kamykn/spelunker.vim", requires = { "kamykn/popup-menu.nvim" } }) -- Spellcheck
	use("glepnir/dashboard-nvim") -- Startup dashboard
	use("luukvbaal/stabilize.nvim") -- Window stabilize
	use({ "folke/todo-comments.nvim", requires = { "nvim-lua/plenary.nvim" } }) -- Todo comment highlights
	use("gpanders/editorconfig.nvim") -- Use .editorconfig files
	use("weilbith/nvim-code-action-menu") -- Code action menu
	use("appelgriebsch/surround.nvim") -- Surround with chars
	use("tversteeg/registers.nvim") -- Visualize registers
	use("mbbill/undotree") -- Visualize undo tree
	use("arp242/undofile_warn.vim") -- Warn if undoing past current
	use({ "ggandor/lightspeed.nvim", requires = { "tpope/vim-repeat" } }) -- Faster movement
	use("tpope/vim-sleuth") -- Auto adjust formatting
	use("vladdoster/remember.nvim") -- Remember last pace in file
	use("svban/YankAssassin.vim") -- Keep cursor in same spot after yank
	use("rmagatti/alternate-toggler") -- Toggle true/false

	-- KITTY
	use({
		"hermitmaster/nvim-kitty-navigator",
		run = "cp kitty/* ~/.config/kitty/",
		config = function()
			require("nvim-kitty-navigator").setup({})
		end,
	}) -- Navigation for kitty
	use("fladson/vim-kitty") -- Syntax highlight for kitty config

	-- COMPLETIONS
	use("hrsh7th/cmp-nvim-lsp") -- Completions
	use("hrsh7th/cmp-buffer") -- Completions
	use("hrsh7th/cmp-path") -- Completions
	use("hrsh7th/cmp-cmdline") -- Completions
	use("hrsh7th/nvim-cmp") -- Completions
	use("hrsh7th/cmp-vsnip") -- Snips
	use("hrsh7th/vim-vsnip") -- Snips

	-- LANGUAGES
	use({ "fatih/vim-go", run = ":GoUpdateBinaries" }) -- Go
	use("sebdah/vim-delve") -- Delve
	use("MunifTanjim/prettier.nvim") -- Prettier formatting
	use("jose-elias-alvarez/null-ls.nvim") -- For prettier
	use("ckipp01/stylua-nvim") -- Lua formatting
	use("euclio/vim-markdown-composer") -- Markdown preview

	-- DEBUG
	use("mfussenegger/nvim-dap") -- Debug adapter
	use("leoluz/nvim-dap-go") -- Adapt delve to dap
	use("David-Kunz/jester") -- Jest test dap debugger
	use("rcarriga/nvim-dap-ui") -- UI for dap

	-- TESTING
	use("buoto/gotests-vim") -- Generate Go tests
	-- use 'hexdigest/gounit-vim' -- Go Tests / Allows templates to be created
	use("vim-test/vim-test") -- Vim-test
	use("tpope/vim-dispatch") -- Vim-test dep
	use("skywind3000/asyncrun.vim") -- Vim-test dep

	-- ENV MANAGEMENT
	use("tpope/vim-dotenv")

	-- GIT
	use({ "tanvirtin/vgit.nvim", requires = { "kyazdani42/nvim-web-devicons", "nvim-lua/plenary.nvim" } }) -- Vgit
	use("sindrets/diffview.nvim") -- Git diff view
	use("rhysd/git-messenger.vim") -- View diffs

	-- PACKER BOOTSTRAP
	if Packer_bootstrap then
		require("packer").sync()
	end
end)

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local reset_group = augroup("reset_group_packer", { clear = true })

autocmd("BufWritePost", { -- Recompile packer on save
	pattern = "plugins.lua",
	group = reset_group,
	callback = function()
		vim.cmd([[ source <afile> | PackerCompile ]])
	end,
})
