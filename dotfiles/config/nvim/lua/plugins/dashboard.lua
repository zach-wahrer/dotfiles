vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_preview_command = "cat"
vim.g.dashboard_preview_pipeline = "lolcat --seed 1"
vim.g.dashboard_preview_file_height = 19
vim.g.dashboard_preview_file_width = 100
vim.g.dashboard_preview_file = "/home/zach/.config/nvim/dashboard.cat"

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
