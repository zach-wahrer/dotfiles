local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.diagnostics.vale,
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.diagnostics.cspell.with({
			extra_args = { "--config", vim.fn.expand("~/.config/cspell/cspell.json") },
		}),
		null_ls.builtins.code_actions.cspell,
	},
	on_attach = function(client, bufnr)
		if client.server_capabilities.document_formatting then
			vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.format {async = true}<CR>")
			-- format on save
			vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.format {async = true}")
		end

		if client.server_capabilities.document_range_formatting then
			vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
		end
	end,
})
