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
			},
		},
	},
}

return M
