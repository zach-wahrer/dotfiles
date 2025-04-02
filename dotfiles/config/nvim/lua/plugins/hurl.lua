
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
	local function close_empty_markdown_windows() -- This is meant to close hurl output buffer/window.
		local windows = vim.api.nvim_list_wins()

		for _, win in ipairs(windows) do
			if vim.api.nvim_win_is_valid(win) then
				local buf = vim.api.nvim_win_get_buf(win)
				local ft = vim.bo[buf].filetype
				local name = vim.api.nvim_buf_get_name(buf)

				if ft == "markdown" and (name == "" or name == "[No Name]") then
					vim.api.nvim_win_close(win, true)

					if vim.api.nvim_buf_is_valid(buf) then
						vim.api.nvim_buf_delete(buf, { force = true })
					end
				end
			end
		end
	end

	vim.api.nvim_create_user_command('HurlClose', function()
		close_empty_markdown_windows()
	end, {})

	require("hurl").setup({
		-- Show debugging info
		debug = false,
		-- Show notification on run
		show_notification = true,
		-- Show response in popup or split
		mode = "split",
		split_size = "40%",
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
