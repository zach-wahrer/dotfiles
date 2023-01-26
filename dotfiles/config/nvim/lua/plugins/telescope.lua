local M = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.0",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
}

function M.config()
	local multi_open_mappings = require("scripts.telescope_multi_open")
	local telescope = require("telescope")

	telescope.setup({
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
		},
	})

	telescope.load_extension("fzf")
	telescope.load_extension("luasnip")
	telescope.load_extension("env")
	telescope.load_extension("zoxide")
	telescope.load_extension("notify")
	telescope.load_extension("undo")
	telescope.load_extension("docker")
end

return M
