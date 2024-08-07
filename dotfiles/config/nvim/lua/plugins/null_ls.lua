local M = {
	"jose-elias-alvarez/null-ls.nvim",
	event = "VeryLazy",
	enabled = false,
}

function M.config()
	local null_ls = require("null-ls")
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	null_ls.setup({
		sources = {
			null_ls.builtins.diagnostics.codespell,
			null_ls.builtins.diagnostics.golangci_lint,
			null_ls.builtins.diagnostics.mypy,
			null_ls.builtins.diagnostics.pylint,

			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.codespell,
			null_ls.builtins.formatting.deno_fmt,
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.formatting.shfmt,
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.formatting.terraform_fmt,
		},
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format()<CR>")
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format({ bufnr = bufnr })
					end,
				})
			end
		end,
	})
end

return M
