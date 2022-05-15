local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local reset_group = augroup("reset_group_tf", { clear = true })

autocmd("BufWritePre", {
	pattern = "*.tf",
	group = reset_group,
	callback = function()
		vim.lsp.buf.formatting_sync()
	end,
})
autocmd("BufWritePre", {
	pattern = "*.tfvars",
	group = reset_group,
	callback = function()
		vim.lsp.buf.formatting_sync()
	end,
})
