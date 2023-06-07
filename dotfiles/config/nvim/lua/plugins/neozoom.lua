local M = {
	"nyngwang/NeoZoom.lua",
	enabled = false,
}

function M.config()
	require("neo-zoom").setup({
		top_ratio = 0,
		left_ratio = 0,
		width_ratio = 1,
		height_ratio = 1,
	})
end

return M
