local M = {
	"jellydn/hurl.nvim",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	-- ft = "hurl",
}

function M.config()
	require("hurl").setup({
		-- Show debugging info
		debug = false,
		-- Show notification on run
		show_notification = true,
		-- Show response in popup or split
		mode = "split",
		split_size = "20%",
		auto_close = false,
		-- Default formatter
		formatters = {
			json = { "jq" }, -- Make sure you have install jq in your system, e.g: brew install jq
			html = {
				"prettier", -- Make sure you have install prettier in your system, e.g: npm install -g prettier
				"--parser",
				"html",
			},
		},
	})
end

return M
