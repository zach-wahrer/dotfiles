vim.api.nvim_set_keymap("n", "<C-C>", require("dial.map").inc_normal(), { noremap = true })
vim.api.nvim_set_keymap("n", "<C-X>", require("dial.map").dec_normal(), { noremap = true })

local augend = require("dial.augend")
require("dial.config").augends:register_group({
	default = {
		augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
		augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
		augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
		augend.date.alias["%Y-%m-%d"],
		augend.date.alias["%m/%d/%Y"],
		augend.date.alias["%m-%d-%Y"],
		augend.date.alias["%H:%M"],
		augend.constant.alias.bool, -- boolean value (true <-> false)
		augend.constant.alias.alpha,
		augend.constant.alias.Alpha,
		augend.semver.alias.semver,
	},
})
