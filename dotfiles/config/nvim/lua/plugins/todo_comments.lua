local M = {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
}

function M.setup()
	require("todo-comments").setup()
end

return M
