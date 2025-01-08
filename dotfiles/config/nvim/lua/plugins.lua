return {
	---------------------------------------------------
	-- THEMES
	---------------------------------------------------
	-- { "navarasu/onedark.nvim", lazy = false, priority = 1000 },
	{
		"maxmx03/fluoromachine.nvim",
		lazy = false,
		priority = 1000,
	},
	-- { "eldritch-theme/eldritch.nvim", lazy = false, priority = 1000 }, -- Interesting
	-- { "cesaralvarod/tokyogogh.nvim", lazy = false,      priority = 1000 }, -- GOOD!
	-- "tiagovla/tokyodark.nvim"
	-- "rebelot/kanagawa.nvim"
	-- "Th3Whit3Wolf/one-nvim"
	-- "marko-cerovac/material.nvim"
	-- "yonlu/omni.vim"
	-- "sainnhe/edge"
	-- "PHSix/nvim-hybrid"
	-- "olimorris/onedarkpro.nvim",
	-- "rmehri01/onenord.nvim"

	---------------------------------------------------
	-- INTERFACE
	---------------------------------------------------
	{ "svban/YankAssassin.vim", event = "VeryLazy" }, -- Keep cursor in same spot after yank
	{ "famiu/bufdelete.nvim", event = "VeryLazy" }, -- Better buffer delete
	{ "arp242/undofile_warn.vim", event = "VeryLazy" }, -- Warn if undoing past current
	{ "chrisbra/Recover.vim", event = "VeryLazy" }, -- Show diffs for swap files
	{
		"gbprod/substitute.nvim",
		event = "VeryLazy",
		config = function()
			require("substitute").setup()
		end,
	}, -- Substitution operator
	{
		"LintaoAmons/bookmarks.nvim",
		dependencies = "stevearc/dressing.nvim",
		event = "VeryLazy",
		enabled = false,
	},
	{
		"tversteeg/registers.nvim",
		config = function()
			require("registers").setup({})
		end,
	},
	{
		"utilyre/sentiment.nvim",
		version = "*",
		event = "VeryLazy", -- keep for lazy loading
		opts = {},
		init = function()
			-- `matchparen.vim` needs to be disabled manually in case of lazy loading
			vim.g.loaded_matchparen = 1
		end,
	}, -- Enhanced matchparen.vim
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup({})
		end,
		event = "VeryLazy",
	}, -- Remember last pace in file
	{
		"tiagovla/scope.nvim",
		config = function()
			require("scope").setup()
		end,
		event = "VeryLazy",
	}, -- Scope buffers to tabs
	{
		"chrishrb/gx.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("gx").setup({
				handler_options = {
					search_engine = "duckduckgo",
				},
			})
		end,
		event = "VeryLazy",
	}, -- Open links with `gx`
	{
		"linrongbin16/gitlinker.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitlinker").setup()
		end,
		event = "VeryLazy",
	},
	-- {
	-- 	"levouh/tint.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("tint").setup({
	-- 			tint = -30,
	-- 			saturation = 0.99,
	-- 		})
	-- 	end,
	-- }, -- Tint inactive windows
	-- {
	-- 	"LunarVim/bigfile.nvim",
	-- 	config = function()
	-- 		require("bigfile").setup({
	-- 			filesize = 1,
	-- 		})
	-- 	end,
	-- }, -- Disable certain features for big files
	{
		"Makaze/watch.nvim",
		cmd = { "WatchStart", "WatchStop", "WatchFile" },
	}, -- Watch running shell commands or files

	---------------------------------------------------
	-- COMPLETIONS / SNIPPETS / TEMPLATES
	---------------------------------------------------
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
	config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
		build = "make install_jsregexp",
		event = "VeryLazy",
	},
	{
		"glepnir/template.nvim",
		cmd = { "Template", "TemProject" },
		config = function()
			require("template").setup({
				temp_dir = "~/.config/nvim/templates",
			})
		end,
		event = "VeryLazy",
	},

	---------------------------------------------------
	-- LANGUAGES
	---------------------------------------------------
	{ "ckipp01/stylua-nvim", ft = "lua" }, -- Lua formatting
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = "markdown",
	},
	-- {
	-- 	"mrcjkb/rustaceanvim",
	-- 	version = "^5", -- Recommended
	-- 	lazy = false, -- This plugin is already lazy
	-- }, -- Rust

	---------------------------------------------------
	-- DEBUG
	---------------------------------------------------
	{
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
		end,
		dependencies = { "mfussenegger/nvim-dap" },
		ft = { "go", "gomod" },
	}, -- Adapt delve to dap

	---------------------------------------------------
	-- TESTING
	---------------------------------------------------
	{
		"yanskun/gotests.nvim",
		config = function()
			require("gotests").setup()
		end,
		ft = { "go", "gomod" },
	}, -- Generate tests for go functions

	---------------------------------------------------
	-- GIT
	---------------------------------------------------
	{ "tpope/vim-fugitive", event = "VeryLazy" }, -- Git functions / Only using blame feature
	{ "rhysd/git-messenger.vim", event = "VeryLazy" }, -- Enhanced gitblame
	{ "sindrets/diffview.nvim", event = "VeryLazy" }, -- Git diff view

	---------------------------------------------------
	-- TERMINAL
	---------------------------------------------------
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()
		end,
	},

	---------------------------------------------------
	-- ENV MANAGEMENT
	---------------------------------------------------
	{
		"ellisonleao/dotenv.nvim",
		config = function()
			require("dotenv").setup()
		end,
		event = "VeryLazy",
	},
}
