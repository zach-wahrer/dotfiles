return {
	---------------------------------------------------
	-- THEMES
	---------------------------------------------------
	{ "navarasu/onedark.nvim", lazy = false, priority = 1000 },
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
	-- TREESITTER --
	---------------------------------------------------
	-- "windwp/nvim-ts-autotag", -- Auto close html,tsx,vue,svelte,php,rescript tags
	"HiPhish/nvim-ts-rainbow2", -- Rainbow tags

	---------------------------------------------------
	-- INPUT
	---------------------------------------------------
	"svban/YankAssassin.vim", -- Keep cursor in same spot after yank
	{
		"ray-x/sad.nvim",
		config = function()
			require("sad").setup({
				diff = "diff-so-fancy",
			})
		end,
		dependencies = { "ray-x/guihua.lua" },
	}, -- Find/replace
	{
		"monkoose/matchparen.nvim",
		config = function()
			require("matchparen").setup({})
		end,
	}, -- Improved parentheses matching

	---------------------------------------------------
	-- INTERFACE
	---------------------------------------------------
	"moll/vim-bbye",     -- Better buffer delete
	"weilbith/nvim-code-action-menu",
	"arp242/undofile_warn.vim", -- Warn if undoing past current
	"kevinhwang91/nvim-bqf", -- Better quick fix
	{
		"karb94/neoscroll.nvim",
		config = function()
			require("neoscroll").setup()
		end,
	},
	{
		"tversteeg/registers.nvim",
		config = function()
			require("registers").setup()
		end,
	}, -- Visualize registers
	{
		"ethanholz/nvim-lastplace",
		config = function()
			require("nvim-lastplace").setup({})
		end,
	}, -- Remember last pace in file
	{
		"tiagovla/scope.nvim",
		config = function()
			require("scope").setup()
		end,
	}, -- Scope buffers to tabs
	{
		"chrishrb/gx.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("gx").setup()
		end,
	}, -- Open links with `gx`
	{
		"lukas-reineke/headlines.nvim",
		dependencies = "nvim-treesitter/nvim-treesitter",
		config = true,
	}, -- Highlighting for headlines in markdown files

	---------------------------------------------------
	-- COMPLETIONS / SNIPPETS
	---------------------------------------------------
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	---------------------------------------------------
	-- LANGUAGES
	---------------------------------------------------
	"sebdah/vim-delve",
	"ckipp01/stylua-nvim", -- Lua formatting
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	"mechatroner/rainbow_csv",

	---------------------------------------------------
	-- DEBUG
	---------------------------------------------------
	{
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup()
		end,
		dependencies = { "mfussenegger/nvim-dap" },
	}, -- Adapt delve to dap

	---------------------------------------------------
	-- TESTING
	---------------------------------------------------
	{
		"yanskun/gotests.nvim",
		config = function()
			require("gotests").setup()
		end,
	},

	---------------------------------------------------
	-- GIT
	---------------------------------------------------
	"rhysd/git-messenger.vim", -- View diffs
	"sindrets/diffview.nvim", -- Git diff view
	"tpope/vim-fugitive", -- Git functions

	---------------------------------------------------
	-- SPELLING
	---------------------------------------------------
	{
		"lewis6991/spellsitter.nvim",
		config = function()
			require("spellsitter").setup()
		end,
	}, -- Spell check within treesitter

	---------------------------------------------------

	-- KITTY
	---------------------------------------------------
	"fladson/vim-kitty", -- Syntax highlight for kitty config
	{
		"hermitmaster/nvim-kitty-navigator",
		build = "cp kitty/* ~/.config/kitty/",
		config = function()
			require("nvim-kitty-navigator").setup()
		end,
	}, -- Navigation for kitty

	---------------------------------------------------
	-- ENV MANAGEMENT
	---------------------------------------------------
	{
		"ellisonleao/dotenv.nvim",
		config = function()
			require("dotenv").setup()
		end,
	},
}
