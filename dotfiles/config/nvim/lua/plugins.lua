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
	use({
		"neovim/nvim-lspconfig",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("lsp.lsp")
		end,
	})
	use({ "folke/lsp-colors.nvim", opt = true, event = "BufReadPre" })
	use({
		"ray-x/lsp_signature.nvim",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("lsp_signature").setup()
		end,
	}) -- Show func signature
	use({ "arkav/lualine-lsp-progress", opt = true, event = "BufReadPre" }) -- Show lsp progress in lualine

	-- INTERFACE
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("interface.lualine")
		end,
	}) -- Status Bar
	use({
		"akinsho/bufferline.nvim",
		tag = "v2.*",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("interface.bufferline")
		end,
	}) -- Buffer management
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("interface.project")
		end,
	}) -- Project management
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("lang.treesitter")
		end,
	}) -- Treesitter
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } },
		config = function()
			require("interface.telescope")
		end,
	}) -- Finder
	use({
		"b3nj5m1n/kommentary",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("interface.kommentary")
		end,
	}) -- Comment
	use({
		"windwp/nvim-autopairs",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	}) -- Auto pairs
	use({
		"petertriho/nvim-scrollbar",
		requires = { "kevinhwang91/nvim-hlslens" },
		config = function()
			require("interface.scrollbar")
		end,
	}) -- Scroll bar
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("interface.nvim_tree")
		end,
	}) -- File browser
	use({ "p00f/nvim-ts-rainbow", opt = true, event = "BufReadPre" }) -- Rainbow brackets
	use({
		"declancm/cinnamon.nvim",
		config = function()
			require("interface.cinnamon")
		end,
	}) -- Smooth scrolling
	use({
		"folke/trouble.nvim",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("interface.trouble")
		end,
	}) -- Pretty list for diagnostics
	use({
		"moll/vim-bbye",
		config = function()
			require("interface.betterbuffer")
		end,
	}) -- Better buffer quit
	use({
		"abecodes/tabout.nvim",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("tabout").setup()
		end,
	}) -- Tab out
	use({
		"lewis6991/spellsitter.nvim",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("spellsitter").setup()
		end,
	}) -- Spell check within treesitter
	use({
		"kamykn/spelunker.vim",
		opt = true,
		event = "BufReadPre",
		requires = { "kamykn/popup-menu.nvim" },
		config = function()
			require("interface.spelunker")
		end,
	}) -- Spellcheck
	use({
		"glepnir/dashboard-nvim",
		config = function()
			require("interface.dashboard")
		end,
	}) -- Startup dashboard
	use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
	}) -- Window stabilize
	use({
		"folke/todo-comments.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("todo-comments").setup()
		end,
	}) -- Todo comment highlights
	use("gpanders/editorconfig.nvim") -- Use .editorconfig files
	use({ "weilbith/nvim-code-action-menu", opt = true, event = "BufReadPre" }) -- Code action menu
	use({ "machakann/vim-sandwich", opt = true, event = "BufReadPre" }) -- Surround with chars
	use({ "tversteeg/registers.nvim", opt = true, event = "BufReadPre" }) -- Visualize registers
	use({
		"mbbill/undotree",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("interface.undotree")
		end,
	}) -- Visualize undo tree
	use({ "arp242/undofile_warn.vim", opt = true, event = "BufReadPre" }) -- Warn if undoing past current
	use({ "ggandor/lightspeed.nvim", requires = { "tpope/vim-repeat" } }) -- Faster movement
	use("tpope/vim-sleuth") -- Auto adjust formatting
	use({
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup({})
		end,
	}) -- Remember last pace in file
	use({ "svban/YankAssassin.vim", opt = true, event = "BufReadPre" }) -- Keep cursor in same spot after yank
	use({
		"monaqa/dial.nvim",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("interface.dial")
		end,
	}) -- Increment/decrement
	use({
		"mvllow/modes.nvim",
		config = function()
			require("modes").setup()
		end,
	}) -- Modes show in different colors
	use({
		"danymat/neogen",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("interface.neogen")
		end,
		requires = "nvim-treesitter/nvim-treesitter",
		-- Uncomment next line if you want to follow only stable versions
		-- tag = "*"
	}) -- Documentation generation
	use({
		"stevearc/dressing.nvim",
	})

	-- KITTY
	use({
		"hermitmaster/nvim-kitty-navigator",
		run = "cp kitty/* ~/.config/kitty/",
		config = function()
			require("nvim-kitty-navigator").setup({})
		end,
	}) -- Navigation for kitty
	use({ "fladson/vim-kitty", opt = true, ft = { "conf" } }) -- Syntax highlight for kitty config

	-- COMPLETIONS
	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("interface.nvm_cmp")
		end,
	}) -- Completions
	use({ "hrsh7th/cmp-nvim-lsp" }) -- Completions
	use({ "hrsh7th/cmp-buffer" }) -- Completions
	use({ "hrsh7th/cmp-path" }) -- Completions
	use({ "hrsh7th/cmp-cmdline" }) -- Completions
	use({ "hrsh7th/cmp-vsnip" }) -- Snips
	use({ "hrsh7th/vim-vsnip" }) -- Snips

	-- LANGUAGES
	use({ "fatih/vim-go", run = ":GoUpdateBinaries", opt = true, ft = { "go" } }) -- Go
	use({ "sebdah/vim-delve", opt = true, ft = { "go" } }) -- Delve
	use({
		"MunifTanjim/prettier.nvim",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("lang.prettier")
		end,
	}) -- prettier formatting
	use({
		"jose-elias-alvarez/null-ls.nvim",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("lsp.null-ls")
		end,
	}) -- For prettier
	use({ "ckipp01/stylua-nvim", opt = true, ft = { "lua" } }) -- Lua formatting
	use({ "euclio/vim-markdown-composer", opt = true, ft = { "md" } }) -- Markdown preview

	-- DEBUG
	use({
		"mfussenegger/nvim-dap",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("debug.dap")
		end,
	}) -- Debug adapter
	use({
		"leoluz/nvim-dap-go",
		opt = true,
		ft = { "go" },
		config = function()
			require("dap-go").setup()
		end,
	}) -- Adapt delve to dap
	use({
		"David-Kunz/jester",
		opt = true,
		ft = { "js", "ts" },
	}) -- Jest test dap debugger
	use({
		"rcarriga/nvim-dap-ui",
		opt = true,
		ft = { "go", "js", "ts" },
		config = function()
			require("dapui").setup()
		end,
	}) -- UI for dap

	-- TESTING
	use({ "buoto/gotests-vim", opt = true, ft = { "go" } }) -- Generate Go tests
	-- use 'hexdigest/gounit-vim' -- Go Tests / Allows templates to be created
	use({
		"vim-test/vim-test",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("testing.vim_test")
		end,
	}) -- Vim-test

	-- ENV MANAGEMENT
	use({ "tpope/vim-dotenv", opt = true, event = "BufReadPre" })

	-- GIT
	use({
		"sindrets/diffview.nvim",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("git.diff_view")
		end,
	}) -- Git diff view
	use({
		"lewis6991/gitsigns.nvim",
		opt = true,
		event = "BufReadPre",
		tag = "release",
		config = function()
			require("git.gitsigns")
		end,
	}) -- Git modified line display
	use({ "rhysd/git-messenger.vim", opt = true, event = "BufReadPre" }) -- View diffs
	use({
		"tpope/vim-fugitive",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("git.fugitive")
		end,
	}) -- Git functions
	use({
		"kdheepak/lazygit.nvim",
		opt = true,
		event = "BufReadPre",
		config = function()
			require("git.lazy_git")
		end,
	}) -- Lazygit integration

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
