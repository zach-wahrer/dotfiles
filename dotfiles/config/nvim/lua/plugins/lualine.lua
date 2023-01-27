local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons", "jcdickinson/wpm.nvim" },
}

function M.config()
	local wpm = require("wpm")

	require("lualine").setup({
		options = {
			theme = "onedark",
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { { "filename", path = 3 } },
			lualine_x = { "encoding", "fileformat", "filetype", wpm.wpm, wpm.historic_graph },
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		extensions = { "nvim-dap-ui", "nvim-tree" },
	})
end

return M
