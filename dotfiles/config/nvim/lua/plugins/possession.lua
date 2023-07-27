local M = {
	"gennaro-tedesco/nvim-possession",
	dependencies = { "ibhagwan/fzf-lua", "nvim-neo-tree/neo-tree.nvim" },
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
		save_hook = function()
			vim.cmd("Neotree close")
		end,
		post_hook = function()
			vim.cmd("Neotree")
		end,
	})
end

return M
