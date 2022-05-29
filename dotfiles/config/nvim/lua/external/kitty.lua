local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local reset_group = augroup("reset_group_kitty", { clear = true })

autocmd("bufwritepost", { -- Reload kitty on config file change
	pattern = "kitty.conf",
	group = reset_group,
	callback = function()
		vim.cmd([[ silent !kill -SIGUSR1 $(pgrep kitty) ]])
	end,
})
