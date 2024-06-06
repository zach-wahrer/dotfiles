local M = {
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			"luvit-meta/library",
		},
	},
	dependencies = {
		"Bilal2453/luvit-meta",
		lazy = true,
	},
}

function M.config()
	require("hurl").setup({
		-- Show debugging info
		debug = false,
		-- Show notification on run
		show_notification = true,
		-- Show response in popup or split
		mode = "popup",
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
