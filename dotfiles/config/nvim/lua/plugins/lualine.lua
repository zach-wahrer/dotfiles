local M = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
		"folke/noice.nvim",
		"gennaro-tedesco/nvim-possession",
		"lewis6991/gitsigns.nvim",
	},
	event = "VeryLazy",
}

function M.config()
	Colors = require("colors")

	local lualine = require("lualine")

	local function show_macro_recording()
		local recording_register = vim.fn.reg_recording()
		if recording_register == "" then
			return ""
		else
			return "󰑊 @" .. recording_register .. " "
		end
	end

	local function show_inlay_hints()
		if vim.lsp.inlay_hint.is_enabled() then
			return " 󰇉 "
		else
			return ""
		end
	end

	local function wordcount()
		local wc = vim.fn.wordcount()
		local words = 0
		local chars = 0

		if wc.visual_words then
			words = wc.visual_words
			chars = wc.visual_chars
		else
			words = wc.words
			chars = wc.chars
		end

		return words .. "w / " .. chars .. "c"
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
				"filetype",
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
				{
					"inlay-hints",
					fmt = show_inlay_hints,
					color = { fg = Colors.purple },
				},
				{ "searchcount", color = { fg = Colors.yellow } },
				{ "require'nvim-possession'.status()", color = { fg = Colors.green } },
				{ "wordcount", fmt = wordcount },
				-- "encoding",
				-- "fileformat",
				-- "filetype",
			},
			lualine_y = { "progress" },
			lualine_z = { "location" },
		},
		extensions = { "neo-tree", "man" },
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
			-- still show a recording occurring because `vim.fn.reg_recording` hasn't emptied yet.
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
