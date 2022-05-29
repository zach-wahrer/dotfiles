local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local reset_group = augroup("reset_group_i3", { clear = true })

autocmd("bufwritepost", { -- Reload i3 on config change
	pattern = "*/i3/config",
	group = reset_group,
	callback = function()
		vim.cmd([[ silent !i3-msg reload ]])
	end,
})
