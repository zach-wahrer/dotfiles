local M = {
	"echasnovski/mini.nvim",
}
function M.config()
	-- require("mini.cursorword").setup()
	-- require("mini.bufremove").setup()
	require("mini.pairs").setup()
	require("mini.surround").setup()

	require("mini.comment").setup({
		mappings = {
			comment = "<C-/>",
			comment_line = "<C-/>",
		},
	})

	require("mini.indentscope").setup({
		symbol = "▏",
		draw = { animation = require("mini.indentscope").gen_animation("none") },
	})

	local map = require("mini.map")
	require("mini.map").setup({
		integrations = {
			map.gen_integration.builtin_search(),
			map.gen_integration.gitsigns(),
			map.gen_integration.diagnostic(),
		},
	})
	map.toggle()
end

return M
