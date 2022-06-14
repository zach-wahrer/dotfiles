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
})
