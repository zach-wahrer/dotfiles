require("lualine").setup({
	options = {
		-- theme = "onedarkpro",
		theme = "onedark",
	},
	sections = {
		lualine_c = {
			"lsp_progress",
		},
	},
	extensions = { "nvim-dap-ui", "nvim-tree" },
})
