local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
		"folke/noice.nvim",
		"gennaro-tedesco/nvim-possession",
		"lewis6991/gitsigns.nvim",
	},
}

function M.config()
	Colors = require("colors")

	require("lualine").setup({
		options = {
			theme = "onedark",
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{ "filename", path = 3, color = { fg = Colors.blue } },
				"branch",
				"diff",
				"diagnostics",
			},
			lualine_c = {
				-- "b:gitsigns_blame_line",
			},
			lualine_x = {
				{ "searchcount",                       color = { fg = Colors.yellow } },
				{ "require'nvim-possession'.status()", color = { fg = Colors.green } },
				-- "encoding",
				-- "fileformat",
				-- "filetype",
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		extensions = { "nvim-dap-ui", "neo-tree", "man" },
	})
end

return M
