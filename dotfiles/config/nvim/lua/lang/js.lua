local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local reset_group = augroup("reset_group_js", { clear = true })

autocmd("FileType", {
	pattern = "ts",
	group = reset_group,
	callback = function()
		vim.cmd([[ set ts=4 sw=4 sts=0 autoindent ]])
	end,
})
autocmd("FileType", {
	pattern = "js",
	group = reset_group,
	callback = function()
		vim.cmd([[ set ts=4 sw=4 sts=0 autoindent ]])
	end,
})
autocmd("FileType", {
	pattern = "vue",
	group = reset_group,
	callback = function()
		vim.cmd([[ set ts=4 sw=4 sts=0 autoindent ]])
	end,
})
autocmd("BufWritePre", {
	pattern = "*.ts",
	group = reset_group,
	callback = function()
		vim.cmd([[ EslintFixAll ]])
	end,
})
autocmd("BufWritePre", {
	pattern = "*.js",
	group = reset_group,
	callback = function()
		vim.cmd([[ EslintFixAll ]])
	end,
})
autocmd("BufWritePre", {
	pattern = "*.vue",
	group = reset_group,
	callback = function()
		vim.cmd([[ EslintFixAll ]])
	end,
})
