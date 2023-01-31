local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons", "folke/noice.nvim" },
}

function M.config()
	local noiceStatus = require("noice").api.status
	Colors = require("colors")

	require("lualine").setup({
		options = {
			theme = "onedark",
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				"branch",
				"diff",
				"diagnostics",
			},
			lualine_c = {
				{ "filename", path = 3 },
				{ noiceStatus.search.get, cond = noiceStatus.search.has, color = { fg = Colors.yellow } },
				{ noiceStatus.mode.get, cond = noiceStatus.mode.has, color = { fg = Colors.red } },
			},
			lualine_x = { "encoding", "fileformat", "filetype" },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		extensions = { "nvim-dap-ui", "nvim-tree" },
	})
end

return M
