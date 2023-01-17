local M = { "gen740/SmoothCursor.nvim" }

function M.config()
	Colors = require("colors")
	require("smoothcursor").setup({
		fancy = {
			head = { cursor = "▷", texthl = "SmoothCursorAqua" },
			enable = true,
		},
		flyin_effect = "top",
		speed = 50,
	})
end

return M
