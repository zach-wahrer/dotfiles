-- Automatically install packer if it doesn't exist locally
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

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
		-- use("tiagovla/tokyodark.nvim")
		-- use("rebelot/kanagawa.nvim")
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

		-- INTERFACE
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("plugins.treesitter")
			end,
			requires = {
				"p00f/nvim-ts-rainbow",
			}, -- Rainbow brackets
		}) -- Treesitter
		use({
			"RRethy/nvim-treesitter-textsubjects",
			config = function()
				require("plugins.treesitter_textsubjects")
			end,
			requires = { "nvim-treesitter/nvim-treesitter" },
		}) -- Text objects
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
			tag = "0.1.0",
			requires = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } },
			config = function()
				require("plugins.telescope")
			end,
		}) -- Finder
		use({
			"benfowler/telescope-luasnip.nvim",
			requires = { "nvim-telescope/telescope.nvim" },
		})
		use({
			"nvim-telescope/telescope-packer.nvim",
			requires = { "nvim-telescope/telescope.nvim" },
		})
		use({
			"LinArcX/telescope-env.nvim",
			requires = { "nvim-telescope/telescope.nvim" },
		})
		use({
			"princejoogie/dir-telescope.nvim",
			requires = { "nvim-telescope/telescope.nvim" },
			config = function()
				require("dir-telescope").setup({ hidden = true, respect_gitignore = true })
			end,
		})
		use({
			"jvgrootveld/telescope-zoxide",
			requires = { "nvim-telescope/telescope.nvim", "nvim-lua/popup.nvim" },
		}) -- Use zoxide within telescope
		-- use({
		-- 	"ahmedkhalf/project.nvim",
		-- 	config = function()
		-- 		require("project_nvim").setup()
		-- 	end,
		-- 	requires = { "nvim-telescope/telescope.nvim" },
		-- }) -- Project management, needed for vim-test to work properly
		-- use({
		-- 	"kyazdani42/nvim-tree.lua",
		-- 	requires = { "kyazdani42/nvim-web-devicons" },
		-- 	config = function()
		-- 		require("plugins.nvim_tree")
		-- 	end,
		-- }) -- File browser
		use({
			"nvim-neo-tree/neo-tree.nvim",
			requires = {
				"kyazdani42/nvim-web-devicons",
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				"s1n7ax/nvim-window-picker",
			},
			branch = "v2.x",
			config = function()
				require("plugins.neo_tree")
			end,
		}) -- File browser
		use({
			"s1n7ax/nvim-window-picker",
			tag = "v1.*",
			config = function()
				require("plugins.window_picker")
			end,
		})
		use({
			"declancm/cinnamon.nvim",
			config = function()
				require("cinnamon").setup()
			end,
		}) -- Smooth scrolling
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
		use({
			"folke/todo-comments.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("plugins.todo_comments")
			end,
		}) -- Todo comment highlights
		use("gpanders/editorconfig.nvim") -- Use .editorconfig files
		use({ "weilbith/nvim-code-action-menu" }) -- Code action menu / Can't lazyload, breaks Treesitter
		use({
			"tversteeg/registers.nvim",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("registers").setup()
			end,
		}) -- Visualize registers
		use({ "arp242/undofile_warn.vim", opt = true, event = "BufReadPre" }) -- Warn if undoing past current
		use({
			"https://gitlab.com/madyanov/svart.nvim",
			config = function()
				require("plugins.svart")
			end,
		}) -- Faster navigation within buffers
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
			"melkster/modicator.nvim",
			after = "onedark.nvim",
			config = function()
				require("plugins.modicator")
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
				require("neogen").setup({
					snippet_engine = "luasnip",
				})
			end,
			requires = "nvim-treesitter/nvim-treesitter",
		}) -- Documentation generation
		use({
			"tiagovla/scope.nvim",
			config = function()
				require("scope").setup()
			end,
		}) -- Scope buffers to tabs
		use({
			"kevinhwang91/nvim-bqf",
		}) -- Better quick fix
		use({
			"monkoose/matchparen.nvim",
			config = function()
				require("matchparen").setup()
			end,
		}) -- Improved parentheses matching
		use({
			"echasnovski/mini.nvim",
			config = function()
				require("plugins.mini_map")
				require("plugins.mini_comment")
				require("plugins.mini_indentscope")
				require("mini.pairs").setup()
				require("mini.cursorword").setup()
				-- require("mini.bufremove").setup()
				require("mini.surround").setup()
			end,
		})
		use({
			"kevinhwang91/nvim-hlslens",
			config = function()
				require("hlslens").setup()
			end,
		}) -- Improved search highlighting
		use({ "moll/vim-bbye" }) -- Better buffer delete
		use({
			"NvChad/nvim-colorizer.lua",
			config = function()
				require("plugins.colorizer")
			end,
		})
		use({
			"folke/noice.nvim",
			config = function()
				require("plugins.noice")
			end,
			requires = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
		}) -- Improved interface
		use({
			"ray-x/sad.nvim",
			config = function()
				require("sad").setup({
					diff = "diff-so-fancy",
				})
			end,
			requires = { "ray-x/guihua.lua" },
		}) -- Find/replace
		use({
			"crusj/bookmarks.nvim",
			branch = "main",
			requires = { "kyazdani42/nvim-web-devicons" },
			config = function()
				require("plugins.bookmarks")
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
				require("luasnip.loaders.from_vscode").lazy_load()
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
			requires = {
				"jose-elias-alvarez/null-ls.nvim",
				config = function()
					require("plugins.null_ls")
				end,
			},
		}) -- prettier formatting
		use({
			"mfussenegger/nvim-lint",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("plugins.nvim_lint")
			end,
		})
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
		use({
			"mechatroner/rainbow_csv",
			opt = true,
			ft = { "csv" },
		}) -- CSV

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
			requires = { "mfussenegger/nvim-dap" },
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
				require("plugins.dap_ui")
			end,
			requires = { "mfussenegger/nvim-dap" },
		}) -- UI for dap
		use({
			"theHamsta/nvim-dap-virtual-text",
			opt = true,
			event = "BufReadPre",
			config = function()
				require("nvim-dap-virtual-text").setup()
			end,
			requires = { "mfussenegger/nvim-dap" },
		}) -- DAP virtual text

		-- TESTING
		-- use({
		-- 	"yasudanaoya/gotests-nvim",
		-- 	opt = true,
		-- 	ft = "go",
		-- 	config = function()
		-- 		require("gotests").setup({})
		-- 	end,
		-- })
		use({
			"buoto/gotests-vim",
			opt = true,
			ft = "go",
			-- config = function()
			-- 	require("gotests").setup({})
			-- end,
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
			tag = "main",
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

		use({
			"tamton-aquib/duck.nvim",
			config = function()
				vim.keymap.set("n", "<leader>cc", function()
					require("duck").hatch("🐈")
				end, {})
				vim.keymap.set("n", "<leader>cr", function()
					require("duck").cook()
				end, {})
			end,
		}) -- Other

		-- PACKER BOOTSTRAP
		if packer_bootstrap then
			require("packer").sync()
		end
	end,
})
