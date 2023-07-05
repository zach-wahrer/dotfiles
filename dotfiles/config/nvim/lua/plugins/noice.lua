local M = {
	"folke/noice.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	event = "VeryLazy",
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
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
		routes = {
			{
				view = "mini",
				filter = { event = "msg_show", find = "Type number and <Enter>" },
			},
		},
	})
end

return M
