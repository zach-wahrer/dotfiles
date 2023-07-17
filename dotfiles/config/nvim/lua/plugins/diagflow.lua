local M = {
	"dgagn/diagflow.nvim",
	event = "VeryLazy",
}

function M.config()
	require("diagflow").setup({
		scope = "line",
		padding_right = 2,
		padding_top = 0,
	})
end

return M
