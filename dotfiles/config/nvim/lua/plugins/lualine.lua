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

	local lualine = require("lualine")

	local function show_macro_recording()
		local recording_register = vim.fn.reg_recording()
		if recording_register == "" then
			return ""
		else
			return "Recording @" .. recording_register
		end
	end

	lualine.setup({
		options = {
			theme = "fluoromachine",
			-- theme = "onedark",
			globalstatus = true,
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				{ "filename", path = 3, color = { fg = Colors.black } },
				"branch",
				"diff",
				"diagnostics",
			},
			lualine_c = {
				-- "b:gitsigns_blame_line",
			},
			lualine_x = {
				{
					"macro-recording",
					fmt = show_macro_recording,
					color = { fg = Colors.red },
				},
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

	vim.api.nvim_create_autocmd("RecordingEnter", {
		callback = function()
			lualine.refresh({
				place = { "statusline" },
			})
		end,
	})

	vim.api.nvim_create_autocmd("RecordingLeave", {
		callback = function()
			-- This is going to seem really weird!
			-- Instead of just calling refresh we need to wait a moment because of the nature of
			-- `vim.fn.reg_recording`. If we tell lualine to refresh right now it actually will
			-- still show a recording occuring because `vim.fn.reg_recording` hasn't emptied yet.
			-- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
			-- ensure `vim.fn.reg_recording` is purged before asking lualine to refresh.
			local timer = vim.loop.new_timer()
			timer:start(
				50,
				0,
				vim.schedule_wrap(function()
					lualine.refresh({
						place = { "statusline" },
					})
				end)
			)
		end,
	})
end

return M
