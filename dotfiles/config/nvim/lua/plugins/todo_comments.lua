local M = {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VeryLazy",
}

function M.config()
	local Colors = require("colors")
	require("todo-comments").setup({
		keywords = {
			TODO = { icon = " ", color = Colors.green },
		},
		highlight = {
			before = "fg",
			after = "fg",
		},
	})
end

return M
