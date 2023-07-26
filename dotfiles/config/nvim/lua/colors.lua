local o = vim.o     -- Global
local api = vim.api -- Api

Colors = {
	-- OneDark Darker Colors
	-- black = "#0e1013",
	-- bg0 = "#1f2329",
	-- bg1 = "#282c34",
	-- bg2 = "#30363f",
	-- bg3 = "#323641",
	-- bg_d = "#181b20",
	-- bg_blue = "#61afef",
	-- bg_yellow = "#e8c88c",
	-- fg = "#a0a8b7",
	-- purple = "#bf68d9",
	-- green = "#8ebd6b",
	-- orange = "#cc9057",
	-- blue = "#4fa6ed",
	-- yellow = "#e2b86b",
	-- cyan = "#48b0bd",
	-- red = "#e55561",
	-- grey = "#535965",
	-- light_gray = "#7a818e",
	-- dark_cyan = "#266269",
	-- dark_red = "#8b3434",
	-- dark_yellow = "#835d1a",
	-- dark_purple = "#7e3992",
	-- diff_add = "#272e23",
	-- diff_delete = "#2d2223",
	-- diff_change = "#172a3a",
	-- diff_text = "#274964",

	-- Fluormachine Colors
	black = "#0e1013",
	bg0 = "#1f2329",
	bg1 = "#282c34",
	bg2 = "#30363f",
	bg3 = "#323641",
	bg_d = "#181b20",
	bg_blue = "#3A89FF",
	bg_yellow = "#FFF700",
	fg = "#a0a8b7",
	purple = "#AF6DF9",
	pink = "#FC199A",
	green = "#72f1b8",
	orange = "#ff8b39",
	blue = "#3A47FF",
	yellow = "#FFCC00",
	cyan = "#61E2FF",
	red = "#fe4450",
	grey = "#535965",
	light_gray = "#7a818e",
	dark_cyan = "#0081A1",
	dark_red = "#BF000D",
	dark_yellow = "#9A7B00",
	dark_purple = "#440092",
	diff_add = "#272e23",
	diff_delete = "#2d2223",
	diff_change = "#172a3a",
	diff_text = "#274964",

	-- Personal
	dark_grey = "#191919",
}

-- require("onedark").setup({
-- 	style = "deep",
-- })
-- require("onedark").load()

require("fluoromachine").setup({
	glow = false,
	-- theme = "retrowave",
	theme = "fluromachine",
	colors = function(_, d)
		return {
			bg = Colors.bg0,
			alt_bg = Colors.bg0,
		}
	end,
	-- overrides = {
	-- ["Normal"] = { bg = Colors.bg0 },
	-- ["SignColumn"] = { bg = Colors.bg0 },
	-- ["NumberColumn"] = { bg = Colors.bg0 },
	-- },
})

vim.cmd.colorscheme("fluoromachine")

o.termguicolors = true

api.nvim_set_hl(0, "Normal", { bg = Colors.bg0 })
api.nvim_set_hl(0, "CursorLine", { bg = Colors.black })
api.nvim_set_hl(0, "Search", { bg = Colors.blue, fg = Colors.black, underline = 1 })
api.nvim_set_hl(0, "CurSearch", { bg = Colors.orange, fg = Colors.black, underline = 1 })
api.nvim_set_hl(0, "SpelunkerSpellBad", { undercurl = 1 })
api.nvim_set_hl(0, "SpelunkerComplexOrCompoundWord", { underdotted = 1 })
api.nvim_set_hl(0, "LspDiagnosticsVirtualTextError", { fg = Colors.red })
api.nvim_set_hl(0, "LspDiagnosticsVirtualTextWarning", { fg = Colors.yellow })
api.nvim_set_hl(0, "LspDiagnosticsVirtualTextInformation", { fg = Colors.light_gray })
api.nvim_set_hl(0, "LspDiagnosticsVirtualTextHint", { fg = Colors.light_gray })
api.nvim_set_hl(0, "LspDiagnosticsUnderlineError", { underline = 1 })
api.nvim_set_hl(0, "LspDiagnosticsUnderlineWarning", { underline = 1 })
api.nvim_set_hl(0, "LspDiagnosticsUnderlineInformation", { underline = 1 })
api.nvim_set_hl(0, "LspDiagnosticsUnderlineHint", { underline = 1 })
api.nvim_set_hl(0, "NeoTreeFileNameOpened", { bg = Colors.black })
api.nvim_set_hl(0, "WinSeparator", { fg = Colors.dark_grey })
api.nvim_set_hl(0, "NvimTreeVertSplit", { fg = Colors.dark_grey })
api.nvim_set_hl(0, "YankHighlight", { bg = Colors.dark_purple })
api.nvim_set_hl(0, "DapBreakpointRed", { bg = "", fg = Colors.red })
api.nvim_set_hl(0, "DapBreakpointGreen", { bg = "", fg = Colors.green })
api.nvim_set_hl(0, "DapBreakpointYellow", { bg = "", fg = Colors.yellow })
api.nvim_set_hl(0, "IlluminatedWordText", { bg = Colors.bg1, underline = 1 })
api.nvim_set_hl(0, "IlluminatedWordRead", { bg = Colors.bg1, underline = 1 })
api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = Colors.bg1, underline = 1 })
api.nvim_set_hl(0, "NoiceMini", { bg = Colors.black, fg = Colors.purple, blend = 0 })
api.nvim_set_hl(0, "TelescopeBorder", { fg = Colors.purple })
api.nvim_set_hl(0, "FlashMatch", { fg = Colors.pruple })
api.nvim_set_hl(0, "FlashLabel", { fg = Colors.orange })

return Colors
