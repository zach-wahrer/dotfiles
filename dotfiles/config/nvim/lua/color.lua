local o = vim.o -- Global
local api = vim.api -- Api

-- Color --
require("onedark").setup({
    style = "deep",
})
require("onedark").load()

o.termguicolors = true

Colors = require("colors")

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
api.nvim_set_hl(0, "WinSeparator", { fg = Colors.dark_grey })
api.nvim_set_hl(0, "NvimTreeVertSplit", { fg = Colors.dark_grey })
api.nvim_set_hl(0, "YankHighlight", { bg = Colors.dark_purple })
api.nvim_set_hl(0, "DapBreakpointRed", { bg = "", fg = Colors.red })
api.nvim_set_hl(0, "DapBreakpointGreen", { bg = "", fg = Colors.green })
api.nvim_set_hl(0, "DapBreakpointYellow", { bg = "", fg = Colors.yellow })
api.nvim_set_hl(0, "IlluminatedWordText", { bg = Colors.bg1, underline = 1 })
api.nvim_set_hl(0, "IlluminatedWordRead", { bg = Colors.bg1, underline = 1 })
api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = Colors.bg1, underline = 1 })
vim.api.nvim_set_hl(0, "NoiceMini", { bg = Colors.black, fg = Colors.purple, blend = 0 })

vim.cmd(
    "let g:rcsv_colorpairs = [['cyan', '#48b0bd'], ['red', '#e55561'], ['lightgray', '#7a818e'],['yellow', '#e2b86b'], ['blue', '#4fa6ed'], ['green', '#8ebd6b'], ['magenta', '#bf68d9'], ['9', '#48b0bd'], ['darkred', '#8b3434'], ['darkyellow', '#835d1a'], ['darkcyan', '#266269'], ['gray', '#535965'], ['darkmagenta', '#7e3992']]"
)
