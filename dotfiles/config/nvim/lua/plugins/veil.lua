local M = {
	"willothy/veil.nvim",
	dependencies = "nvim-lua/plenary.nvim",
}

function M.config()
	Colors = require("colors")
	local cfgPath = vim.fn.stdpath("config")

	local slides = {
		"/slides/dashboard7.cat",
		"/slides/dashboard2.cat",
		"/slides/dashboard3.cat",
		"/slides/dashboard4.cat",
		"/slides/dashboard5.cat",
		"/slides/dashboard6.cat",
		"/slides/dashboard.cat",
		"/slides/dashboard5.cat",
		"/slides/dashboard4.cat",
		"/slides/dashboard3.cat",
		"/slides/dashboard2.cat",
	}

	texts = {}
	for _, slide in pairs(slides) do
		local f = io.open(cfgPath .. slide)
		local text = {}
		if f ~= nil then
			for each in f:lines() do
				text[#text + 1] = each
			end
		end
		texts[#texts + 1] = text
	end

	local builtin = require("veil.builtin")
	require("veil").setup({
		sections = {
			builtin.sections.animated(texts, {
				hl = { fg = Colors.pink },
			}),
		},
	})
end

return M
