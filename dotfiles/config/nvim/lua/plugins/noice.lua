local M = {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}

function M.config()
	require("noice").setup({
		cmdline = {
			view = "cmdline",
		},
		lsp = {
			signature = {
				enabled = false,
			},
		},
	})
end

return M
