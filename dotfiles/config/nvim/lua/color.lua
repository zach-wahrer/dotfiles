local o = vim.o -- Global
local api = vim.api -- Api

-- Color --
require("onedark").setup({
	style = "deep",
})
require("onedark").load()

o.termguicolors = true

Colors = {
	-- OneDark Darker Colors
	black = "#0e1013",
	bg0 = "#1f2329",
	bg1 = "#282c34",
	bg2 = "#30363f",
	bg3 = "#323641",
	bg_d = "#181b20",
	bg_blue = "#61afef",
	bg_yellow = "#e8c88c",
	fg = "#a0a8b7",
	purple = "#bf68d9",
	green = "#8ebd6b",
	orange = "#cc9057",
	blue = "#4fa6ed",
	yellow = "#e2b86b",
	cyan = "#48b0bd",
	red = "#e55561",
	grey = "#535965",
	light_grey = "#7a818e",
	dark_cyan = "#266269",
	dark_red = "#8b3434",
	dark_yellow = "#835d1a",
	dark_purple = "#7e3992",
	diff_add = "#272e23",
	diff_delete = "#2d2223",
	diff_change = "#172a3a",
	diff_text = "#274964",

	-- Personal
	dark_grey = "#191919",
}

api.nvim_set_hl(0, "Search", { bg = Colors.blue, fg = Colors.black, underline = 1 })
api.nvim_set_hl(0, "SpelunkerSpellBad", { undercurl = 1 })
api.nvim_set_hl(0, "SpelunkerComplexOrCompoundWord", { underdotted = 1 })
api.nvim_set_hl(0, "LspDiagnosticsVirtualTextError", { fg = Colors.red })
api.nvim_set_hl(0, "LspDiagnosticsVirtualTextWarning", { fg = Colors.yellow })
api.nvim_set_hl(0, "LspDiagnosticsVirtualTextInformation", { fg = Colors.light_grey })
api.nvim_set_hl(0, "LspDiagnosticsVirtualTextHint", { fg = Colors.light_grey })
api.nvim_set_hl(0, "LspDiagnosticsUnderlineError", { underline = 1 })
api.nvim_set_hl(0, "LspDiagnosticsUnderlineWarning", { underline = 1 })
api.nvim_set_hl(0, "LspDiagnosticsUnderlineInformation", { underline = 1 })
api.nvim_set_hl(0, "LspDiagnosticsUnderlineHint", { underline = 1 })
api.nvim_set_hl(0, "WinSeparator", { fg = Colors.dark_grey })
api.nvim_set_hl(0, "NvimTreeVertSplit", { fg = Colors.dark_grey })
api.nvim_set_hl(0, "YankHighlight", { bg = Colors.dark_purple })
api.nvim_set_hl(0, "DapBreakpointRed", { bg = "", fg = Colors.red })
api.nvim_set_hl(0, "DapBreakpointGreen", { bg = "", fg = Colors.green })
api.nvim_set_hl(0, "DapBreakpointYellow", { bg = "", fg = Colors.yellow })

vim.cmd(
	"let g:rcsv_colorpairs = [['cyan', '#48b0bd'], ['red', '#e55561'], ['lightgray', '#7a818e'],['yellow', '#e2b86b'], ['blue', '#4fa6ed'], ['green', '#8ebd6b'], ['magenta', '#bf68d9'], ['9', '#48b0bd'], ['darkred', '#8b3434'], ['darkyellow', '#835d1a'], ['darkcyan', '#266269'], ['gray', '#535965'], ['darkmagenta', '#7e3992']]"
)
