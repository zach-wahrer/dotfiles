local M = {
	"ray-x/sad.nvim",
	dependencies = { "ray-x/guihua.lua" },
	event = "VeryLazy",
}

function M.config()
	require("sad").setup({
		diff = "diff-so-fancy",
	})
end

return M
