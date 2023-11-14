local M = {
	"mvllow/modes.nvim",
	event = "VeryLazy",
}

function M.config()
	Colors = require("colors")
	require("modes").setup({
		colors = {
			copy = Colors.yellow,
			delete = Colors.red,
			insert = Colors.blue,
			visual = Colors.purple,
		},
	})
end

return M
