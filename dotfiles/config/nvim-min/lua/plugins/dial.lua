local M = {
	"monaqa/dial.nvim",
	event = "VeryLazy",
}

function M.config()
	local augend = require("dial.augend")
	require("dial.config").augends:register_group({
		default = {
			augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
			augend.date.alias["%Y-%m-%d"],
			augend.date.alias["%m/%d/%Y"],
			augend.date.alias["%H:%M"],
			augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
			augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
			augend.constant.alias.bool, -- boolean value (true <-> false)
			augend.constant.alias.alpha,
			augend.constant.alias.Alpha,
			augend.semver.alias.semver,
		},
	})
end

return M
