local M = {
	"s1n7ax/nvim-window-picker",
	event = "VeryLazy",
}

function M.config()
	Colors = require("colors")

	require("window-picker").setup({
		autoselect_one = true,
		include_current = false,
		filter_rules = {
			-- filter using buffer options
			bo = {
				-- if the file type is one of following, the window will be ignored
				filetype = { "neo-tree", "neo-tree-popup", "notify" },

				-- if the buffer type is one of following, the window will be ignored
				buftype = { "terminal", "quickfix" },
			},
		},
		highlights = {
			statusline = {
				focused = {
					fg = Colors.fg,
					bg = Colors.pink,
					bold = true,
				},
			},
		},
	})
end

return M
