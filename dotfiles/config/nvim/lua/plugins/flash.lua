local M = {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			search = {
				enabled = false,
			},
			char = {
				enabled = true,
				jump_labels = true,
				keys = { "f", "F" },
				multi_line = false,
			},
		},
	},
}

return M
