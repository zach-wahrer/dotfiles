local M = {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"LinArcX/telescope-env.nvim",
		"tsakirist/telescope-lazy.nvim",
		{ "aaronhallaert/advanced-git-search.nvim", dependencies = "tpope/vim-fugitive" },
		"debugloop/telescope-undo.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	event = "VeryLazy",
}

function M.config()
	local multi_open_mappings = require("scripts.telescope_multi_open")
	local telescope = require("telescope")
	local defaults = {
		vimgrep_arguments = {
			"rg",
			-- "--color=never",
			"--multiline",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			-- "--hidden",
			"--sort",
			"path",
		},
		-- path_display = { "smart" },
		path_display = { "truncate" },
	}

	telescope.setup({
		defaults = defaults,
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				-- the default case_mode is "smart_case"
			},
		},
		pickers = {
			oldfiles = {
				mappings = multi_open_mappings,
			},
			live_grep = {
				mappings = multi_open_mappings,
			},
			find_files = {
				follow = true,
				mappings = multi_open_mappings,
			},
			grep_string = {
				mappings = multi_open_mappings,
			},
			lsp_references = {
				mappings = multi_open_mappings,
			},
		},
	})

	telescope.load_extension("advanced_git_search")
	telescope.load_extension("env")
	telescope.load_extension("find_template")
	telescope.load_extension("fzf")
	telescope.load_extension("undo")
	telescope.load_extension("lazy")
end

return M
