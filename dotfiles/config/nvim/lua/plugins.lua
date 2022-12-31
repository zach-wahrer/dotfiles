return {
	---------------------------------------------------
	-- THEMES
	---------------------------------------------------
	"navarasu/onedark.nvim",
	-- "tiagovla/tokyodark.nvim"
	-- "rebelot/kanagawa.nvim"
	-- "Th3Whit3Wolf/one-nvim"
	-- "marko-cerovac/material.nvim"
	-- "yonlu/omni.vim"
	-- "sainnhe/edge"
	-- "PHSix/nvim-hybrid"
	-- "olimorris/onedarkpro.nvim"
	-- "rmehri01/onenord.nvim"

	---------------------------------------------------
	-- LSP --
	---------------------------------------------------
	{
		"ray-x/lsp_signature.nvim",
		config = function()
			require("lsp_signature").setup()
		end,
	}, -- Show func signature

	---------------------------------------------------
	-- TREESITTER --
	---------------------------------------------------
	"windwp/nvim-ts-autotag", -- Auto close html,tsx,vue,svelte,php,rescript tags
	"p00f/nvim-ts-rainbow", -- Rainbow tags

	---------------------------------------------------
	-- TELESCOPE
	---------------------------------------------------
	{
		"benfowler/telescope-luasnip.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"LinArcX/telescope-env.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
	{
		"princejoogie/dir-telescope.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
		config = function()
			require("dir-telescope").setup({ hidden = true, respect_gitignore = true })
		end,
	},
	{
		"jvgrootveld/telescope-zoxide",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/popup.nvim" },
	}, -- Use zoxide within telescope
	{
		"debugloop/telescope-undo.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},

	---------------------------------------------------
	-- INPUT
	---------------------------------------------------
	"svban/YankAssassin.vim", -- Keep cursor in same spot after yank
	{
		"abecodes/tabout.nvim",
		config = function()
			require("tabout").setup()
		end,
		dependencies = "nvim-treesitter/nvim-treesitter",
	}, -- Tab out
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({
				snippet_engine = "luasnip",
			})
		end,
		dependencies = "nvim-treesitter/nvim-treesitter",
	}, -- Documentation generation
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
			require("matchparen").setup()
		end,
	}, -- Improved parentheses matching

	---------------------------------------------------
	-- INTERFACE
	---------------------------------------------------
	"moll/vim-bbye", -- Better buffer delete
	"gpanders/editorconfig.nvim", -- Use .editorconfig files
	"weilbith/nvim-code-action-menu", -- Code action menu / Can't lazyload, breaks Treesitter
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
		"kevinhwang91/nvim-hlslens",
		config = function()
			require("hlslens").setup()
		end,
	}, -- Improved search highlighting

	---------------------------------------------------
	-- COMPLETIONS / SNIPPETS
	---------------------------------------------------
	{
		"L3MON4D3/LuaSnip",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	}, -- Snips

	---------------------------------------------------
	-- LANGUAGES
	---------------------------------------------------
	"sebdah/vim-delve", -- Delve
	"ckipp01/stylua-nvim", -- Lua formatting
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	}, -- Markdown
	"mechatroner/rainbow_csv", -- CSV

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
	"David-Kunz/jester", -- Jest test dap debugger
	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
		dependencies = { "mfussenegger/nvim-dap" },
	}, -- DAP virtual text

	---------------------------------------------------
	-- TESTING
	---------------------------------------------------
	-- "buoto/gotests-vim",
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
			require("nvim-kitty-navigator").setup({})
		end,
	}, -- Navigation for kitty

	---------------------------------------------------
	-- ENV MANAGEMENT
	---------------------------------------------------
	--  "tpope/vim-dotenv",
	--  "ellisonleao/dotenv.nvim",
}
