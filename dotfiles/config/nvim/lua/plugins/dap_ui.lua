local M = {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"przepompownia/nvim-dap-tab",
	},
	event = "VeryLazy",
}

function M.config()
	require("dapui").setup({
		layouts = {
			{
				elements = {
					-- Elements can be strings or table with id and size keys.
					-- { id = "scopes", size = 0.25 },
					"breakpoints",
					"stacks",
					"watches",
				},
				size = 40, -- 40 columns
				position = "left",
			},
			{
				elements = {
					"repl",
					-- "console",
				},
				size = 0.25, -- 20% of total lines
				position = "bottom",
			},
			{
				elements = {
					"scopes",
				},
				size = 0.25, -- 20% of total lines
				position = "bottom",
			},
		},
	})
	require("dap-tab").setup({})
end

return M
