-- Automatically install packer if it doesn't exist locally
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

-- Recompile packer after saving this file
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "plugins.lua",
	group = vim.api.nvim_create_augroup("reset_group_packer", { clear = true }),
	callback = function()
		vim.cmd([[ source <afile> | PackerCompile ]])
	end,
})

require("packer").startup({
	config = {
		-- Move to lua dir so impatient.nvim can cache it
		-- compile_path = vim.fn.stdpath("config") .. "/plugin/packer_compiled.lua",
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},

	function(use)
		-- PACKER
		use("wbthomason/packer.nvim")

		-- OPTIMIZATION
		use("lewis6991/impatient.nvim")
		use("nathom/filetype.nvim")

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
			config = function()
				require("plugins.lsp")
			end,
		})
		use({
			"ray-x/lsp_signature.nvim",
			config = function()
				require("lsp_signature").setup()
			end,
		}) -- Show func signature
		use({
			"j-hui/fidget.nvim",
			config = function()
				require("fidget").setup({})
			end,
		}) -- Show lsp progress/status
		use({ "cseickel/diagnostic-window.nvim", requires = { "MunifTanjim/nui.nvim" } })

		-- INTERFACE
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("plugins.treesitter")
			end,
			requires = { "p00f/nvim-ts-rainbow", "nvim-treesitter/nvim-treesitter-textobjects" }, -- Rainbow brackets, Text objects
		}) -- Treesitter
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		}) -- Auto pairs for brackets
		use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("plugins.lualine")
			end,
		}) -- Status Bar
		use({
			"akinsho/bufferline.nvim",
			tag = "v2.*",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("plugins.bufferline")
			end,
		}) -- Buffer management
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } },
			config = function()
				require("plugins.telescope")
			end,
		}) -- Finder
		use({
			"ahmedkhalf/project.nvim",
			config = function()
				require("project_nvim").setup()
				require("telescope").load_extension("projects")
			end,
			requires = { "nvim-telescope/telescope.nvim" },
		}) -- Project management
		use({
			"windwp/nvim-spectre",
			requires = { "nvim-lua/plenary.nvim" },
		}) -- Find/Replace
		use({
			"b3nj5m1n/kommentary",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("plugins.kommentary")
			end,
		}) -- Comment
		use({
			"petertriho/nvim-scrollbar",
			requires = { "kevinhwang91/nvim-hlslens" },
			config = function()
				require("plugins.scrollbar")
			end,
		}) -- Scroll bar
		use({
			"kyazdani42/nvim-tree.lua",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("plugins.nvim_tree")
			end,
		}) -- File browser
		use({
			"declancm/cinnamon.nvim",
			config = function()
				require("plugins.cinnamon")
			end,
		}) -- Smooth scrolling
		use({ "moll/vim-bbye" }) -- Better buffer quit
		use({
			"abecodes/tabout.nvim",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("tabout").setup()
			end,
			requires = "nvim-treesitter/nvim-treesitter",
		}) -- Tab out
		use({
			"lewis6991/spellsitter.nvim",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("spellsitter").setup()
			end,
			requires = "nvim-treesitter/nvim-treesitter",
		}) -- Spell check within treesitter
		use({
			"kamykn/spelunker.vim",
			opt = true,
			event = "BufReadPre",
			requires = { "kamykn/popup-menu.nvim" },
			config = function()
				require("plugins.spelunker")
			end,
		}) -- Syntax aware spellcheck
		-- use({
		-- 	"glepnir/dashboard-nvim",
		-- 	config = function()
		-- 		require("plugins.dashboard")
		-- 	end,
		-- }) -- Startup dashboard
		use({
			"folke/todo-comments.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("plugins.todo-comments")
			end,
		}) -- Todo comment highlights
		use("gpanders/editorconfig.nvim") -- Use .editorconfig files
		use({ "weilbith/nvim-code-action-menu" }) -- Code action menu / Can't lazyload, breaks Treesitter
		use({ "tversteeg/registers.nvim", opt = true, event = "BufReadPre" }) -- Visualize registers
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
				require("plugins.dial")
			end,
		}) -- Increment/decrement
		use({
			"kylechui/nvim-surround",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("nvim-surround").setup({})
			end,
		}) -- Surround
		use({
			"mvllow/modes.nvim",
			config = function()
				require("modes").setup()
			end,
		}) -- Modes show in different colors
		use({
			"zbirenbaum/neodim",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("plugins.neodim")
			end,
		}) -- Dim unused vars/functions/etc
		use({
			"danymat/neogen",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("neogen").setup({})
			end,
			requires = "nvim-treesitter/nvim-treesitter",
		}) -- Documentation generation
		use({
			"stevearc/dressing.nvim",
		}) -- Pretty default interfaces
		use({
			"tiagovla/scope.nvim",
			config = function()
				require("scope").setup()
			end,
		}) -- Scope buffers to tabs
		use({
			"rmagatti/auto-session",
			config = function()
				require("auto-session").setup({})
			end,
		})
		use({
			"rmagatti/session-lens",
			requires = { "rmagatti/auto-session", "nvim-telescope/telescope.nvim" },
			config = function()
				require("session-lens").setup({--[[your custom config--]]
				})
			end,
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
				require("plugins.nvm_cmp")
			end,
		}) -- Completions
		use({ "hrsh7th/cmp-nvim-lsp" }) -- Completions
		use({ "hrsh7th/cmp-buffer" }) -- Completions
		use({ "hrsh7th/cmp-path" }) -- Completions
		use({ "hrsh7th/cmp-cmdline" }) -- Completions
		-- use({ "hrsh7th/cmp-vsnip" }) -- Snips
		-- use({ "hrsh7th/vim-vsnip" }) -- Snips
		use({
			"L3MON4D3/LuaSnip",
			config = function()
				require("plugins.luasnip")
			end,
		}) -- Snips
		use({ "saadparwaiz1/cmp_luasnip" }) -- Snips
		use({
			"rafamadriz/friendly-snippets",
			config = function()
				require("plugins.friendly_snippets")
			end,
		}) -- Snippets

		-- LANGUAGES
		use({
			"fatih/vim-go",
			run = ":GoUpdateBinaries",
			opt = true,
			ft = { "go", "mod" },
			config = function()
				require("plugins.vim_go")
			end,
		}) -- Go
		use({ "sebdah/vim-delve", opt = true, ft = { "go" } }) -- Delve
		use({
			"MunifTanjim/prettier.nvim",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("plugins.prettier")
			end,
		}) -- prettier formatting
		use({
			"jose-elias-alvarez/null-ls.nvim",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("plugins.null-ls")
			end,
		}) -- For prettier
		use({
			"windwp/nvim-ts-autotag",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("nvim-ts-autotag").setup()
			end,
		}) -- Auto close html,tsx,vue,svelte,php,rescript tags
		use({ "ckipp01/stylua-nvim", opt = true, ft = { "lua" } }) -- Lua formatting
		use({
			"iamcco/markdown-preview.nvim",
			run = "cd app && npm install",
			setup = function()
				vim.g.mkdp_filetypes = { "markdown" }
			end,
			ft = { "markdown", "md" },
		}) -- Markdown

		-- DEBUG
		use({
			"mfussenegger/nvim-dap",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("plugins.dap")
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
			event = "BufReadPre",
		}) -- Jest test dap debugger
		use({
			"rcarriga/nvim-dap-ui",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("dapui").setup()
			end,
		}) -- UI for dap
		use({
			"theHamsta/nvim-dap-virtual-text",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("nvim-dap-virtual-text").setup()
			end,
		}) -- DAP virtual text

		-- TESTING
		use({
			"yasudanaoya/gotests-nvim",
			opt = true,
			ft = "go",
			config = function()
				require("gotests").setup()
			end,
		})
		use({
			"vim-test/vim-test",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("plugins.vim_test")
			end,
		}) -- Vim-test

		-- ENV MANAGEMENT
		use({ "tpope/vim-dotenv", opt = true, event = "BufReadPre" })

		-- GIT
		use({
			"sindrets/diffview.nvim",
			opt = true,
			event = "BufReadPre",
		}) -- Git diff view
		use({
			"lewis6991/gitsigns.nvim",
			opt = true,
			event = "BufReadPre",
			tag = "release",
			config = function()
				require("plugins.gitsigns")
			end,
		}) -- Git modified line display
		use({ "rhysd/git-messenger.vim", opt = true, event = "BufReadPre" }) -- View diffs
		use({
			"tpope/vim-fugitive",
		}) -- Git functions / Can't lazyload, breaks Treesitter
		use({
			"kdheepak/lazygit.nvim",
		}) -- Lazygit integration/ Can't lazyload, breaks Treesitter

		-- PACKER BOOTSTRAP
		if Packer_bootstrap then
			require("packer").sync()
		end
	end,
})
