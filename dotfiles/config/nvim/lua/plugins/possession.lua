local M = {
	"gennaro-tedesco/nvim-possession",
	dependencies = { "ibhagwan/fzf-lua" },
	event = "VeryLazy",
}

function M.config()
	require("nvim-possession").setup({
		sessions = {
			sessions_icon = "󰍳 ",
		},
		autoswitch = {
			enable = true,
		},
	})
end

return M
