return {
	---------------------------------------------------
	-- THEMES
	---------------------------------------------------
	-- { "navarasu/onedark.nvim", lazy = false, priority = 1000 },
	{ "maxmx03/fluoromachine.nvim", lazy = false, priority = 1000 },
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
	-- INTERFACE
	---------------------------------------------------
	{ "svban/YankAssassin.vim", event = "VeryLazy" }, -- Keep cursor in same spot after yank
	{ "moll/vim-bbye", event = "VeryLazy" }, -- Better buffer delete
	{ "arp242/undofile_warn.vim", event = "VeryLazy" }, -- Warn if undoing past current
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
	},
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
	{ "ckipp01/stylua-nvim", ft = "lua" }, -- Lua formatting

	---------------------------------------------------
	-- GIT
	---------------------------------------------------
	{ "tpope/vim-fugitive", event = "VeryLazy" }, -- Git functions / Only using blame feature
	{ "rhysd/git-messenger.vim", event = "VeryLazy" }, -- Enhanced gitblame
	{ "sindrets/diffview.nvim", event = "VeryLazy" }, -- Git diff view

	--------------------------------------------------
	-- WEZTERM
	---------------------------------------------------
	{
		"numToStr/Navigator.nvim",
		config = function()
			require("Navigator").setup()
		end,
	},
}
