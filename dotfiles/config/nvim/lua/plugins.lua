return {
	---------------------------------------------------
	-- THEMES
	---------------------------------------------------
	-- { "navarasu/onedark.nvim", lazy = false, priority = 1000 },
	{ "maxmx03/fluoromachine.nvim", lazy = false,      priority = 1000 },
	-- { "cesaralvarod/tokyogogh.nvim", lazy = false, priority = 1000 }, -- GOOD!
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
	-- INPUT
	---------------------------------------------------
	{ "svban/YankAssassin.vim",     event = "VeryLazy" }, -- Keep cursor in same spot after yank

	---------------------------------------------------
	-- INTERFACE
	---------------------------------------------------
	{ "moll/vim-bbye",              event = "VeryLazy" }, -- Better buffer delete
	{ "arp242/undofile_warn.vim",   event = "VeryLazy" }, -- Warn if undoing past current
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
		event = "VeryLazy",
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
			require("gx").setup()
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
	{
		"smoka7/multicursors.nvim",
		dependencies = { "smoka7/hydra.nvim" },
		event = "VeryLazy",
		opts = {},
	},

	---------------------------------------------------
	-- COMPLETIONS / SNIPPETS
	---------------------------------------------------
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
		event = "VeryLazy",
	},

	---------------------------------------------------
	-- LANGUAGES
	---------------------------------------------------
	{ "ckipp01/stylua-nvim",     ft = "lua" }, -- Lua formatting
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = "markdown",
	},

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
	{ "tpope/vim-fugitive",      event = "VeryLazy" }, -- Git functions / Only using blame feature
	{ "rhysd/git-messenger.vim", event = "VeryLazy" }, -- Enhanced gitblame
	{ "sindrets/diffview.nvim",  event = "VeryLazy" }, -- Git diff view

	---------------------------------------------------
	-- KITTY
	---------------------------------------------------
	{
		"fladson/vim-kitty",
		ft = "kitty",
	}, -- Syntax highlight for kitty config
	{
		"hermitmaster/nvim-kitty-navigator",
		build = "cp kitty/* ~/.config/kitty/",
		config = function()
			require("nvim-kitty-navigator").setup()
		end,
		event = "VeryLazy",
	}, -- Navigation for kitty

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
