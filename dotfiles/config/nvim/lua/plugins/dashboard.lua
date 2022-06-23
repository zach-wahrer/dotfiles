local db = require("dashboard")

db.preview_command = "cat | lolcat --seed 1"
db.preview_file_path = "~/.config/nvim/dashboard.cat"
db.preview_file_height = 19
db.preview_file_width = 100
db.custom_center = {
	{
		icon = "🗐   ",
		desc = "Recently Opened Files",
		action = "Telescope oldfiles",
	},
	{
		icon = "🗋   ",
		desc = "New File             ",
		action = "DashboardNewFile",
	},
	{
		icon = "🗎   ",
		desc = "Find File            ",
		action = "Telescope find_files",
	},
	{
		icon = "🖮   ",
		desc = "Keymap               ",
		action = "Telescope keymaps",
	},
	{
		icon = "🖌   ",
		desc = "Change Colorscheme   ",
		action = "Telescope colorscheme",
	},
}

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local reset_group = augroup("reset_group_dashboard", { clear = true })
autocmd("WinEnter,FocusGained", { -- No line nums for dashboard
	pattern = "dashboard",
	group = reset_group,
	callback = function()
		vim.cmd([[ set norelativenumber ]])
	end,
})
-- vim.g.dashboard_custom_header = {
-- 	"=================     ===============     ===============   ========  ========",
-- 	"\\ . . . . . . .\\   //. . . . . . .\\   //. . . . . . .\\  \\. . .\\// . . //",
-- 	"||. . ._____. . .|| ||. . ._____. . .|| ||. . ._____. . .|| || . . ./ . . .||",
-- 	"|| . .||   ||. . || || . .||   ||. . || || . .||   ||. . || ||. . . . . . . ||",
-- 	"||. . ||   || . .|| ||. . ||   || . .|| ||. . ||   || . .|| || . | . . . . .||",
-- 	"|| . .||   ||. _-|| ||-_ .||   ||. . || || . .||   ||. _-|| ||-_.| . . . . ||",
-- 	"||. . ||   ||-'  || ||  `-||   || . .|| ||. . ||   ||-'  || ||  `|_ . .|. .||",
-- 	"|| . _||   ||    || ||    ||   ||_ . || || . _||   ||    || ||   | `-_/| . ||",
-- 	"||_-' ||  .|/    || ||    |.  || `-_|| ||_-' ||  .|/    || ||   |   / |-_.||",
-- 	"||    ||_-'      || ||      `-_||    || ||    ||_-'      || ||   |   / |  `||",
-- 	"||    `'         || ||         `'    || ||    `'         || ||   |   / |   ||",
-- 	"||            .===' `===.         .==='.`===.         .===' /==. |  /  |   ||",
-- 	"||         .=='   _|-_ `===. .==='   _|_   `===. .===' _-|/   `==  /  |   ||",
-- 	"||      .=='    _-'    `-_  `='    _-'   `-_    `='  _-'   `-_  /|  /  |   ||",
-- 	"||   .=='    _-'          '-__._-'         '-_./__-'         `' |. /|  |   ||",
-- 	"||.=='    _-'                                                     `' |  /==.||",
-- 	"=='    _-'                        N E O V I M                         /   `==",
-- 	"   _-'                                                                `-_   /",
-- 	" `''                                                                      ``'",
-- }
