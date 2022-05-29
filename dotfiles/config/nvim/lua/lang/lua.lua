local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local reset_group = augroup("reset_group_lua", { clear = true })

autocmd("BufWritePre", {
	pattern = "*.lua",
	group = reset_group,
	callback = function()
		require("stylua-nvim").format_file()
	end,
})
