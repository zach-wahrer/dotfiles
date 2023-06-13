local M = {
	"jose-elias-alvarez/null-ls.nvim",
}

function M.config()
	local null_ls = require("null-ls")
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	local sources = {
		-- null_ls.builtins.code_actions.cspell,
		-- null_ls.builtins.code_actions.eslint,
		-- null_ls.builtins.code_actions.gitsigns,
		-- null_ls.builtins.code_actions.shellcheck,

		-- null_ls.builtins.diagnostics.checkmake,
		-- null_ls.builtins.diagnostics.cspell.with({
		-- 	extra_args = { "--config", vim.fn.expand("~/.config/cspell/cspell.json") },
		-- }),
		-- null_ls.builtins.diagnostics.dotenv_linter,
		-- null_ls.builtins.diagnostics.eslint,
		-- null_ls.builtins.diagnostics.gitlint,
		-- null_ls.builtins.diagnostics.hadolint,
		-- null_ls.builtins.diagnostics.markdownlint_cli2,
		-- null_ls.builtins.diagnostics.vale,
		-- null_ls.builtins.diagnostics.zsh,
		null_ls.builtins.diagnostics.revive,

		-- null_ls.builtins.formatting.golines.with({
		-- 	extra_args = {
		-- 		"--max-len=180",
		-- 		"--base-formatter=gofumpt",
		-- 	},
		-- }),
		null_ls.builtins.formatting.beautysh,
		-- null_ls.builtins.formatting.eslint,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.terraform_fmt,
	}

	-- local gotest = require("go.null_ls").gotest()
	-- local gotest_codeaction = require("go.null_ls").gotest_action()
	-- local golangci_lint = require("go.null_ls").golangci_lint()
	-- table.insert(sources, gotest)
	-- table.insert(sources, gotest_codeaction)
	-- table.insert(sources, golangci_lint)

	null_ls.setup({
		sources = sources,
		debounce = 1000,
		default_timeout = 5000,
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
