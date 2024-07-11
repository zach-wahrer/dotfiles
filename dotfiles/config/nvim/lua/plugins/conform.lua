local M = {
	"stevearc/conform.nvim",
}

function M.config()
	require("conform").setup({
		formatters_by_ft = {
			["*"] = { "codespell" },
			graphql = { "prettier" },
			javascript = { "deno_fmt", "prettier" },
			json = { "deno_fmt", "prettier" },
			lua = { "stylua" },
			markdown = { "deno_fmt", "prettier" },
			python = { "ruff" },
			rust = { "rustfmt" },
			sh = { "shfmt" },
			terraform = "terraform_fmt",
			tf = "terraform_fmt",
			typescript = { "deno_fmt", "prettier" },
			yaml = { "prettier" },
			-- -- Use a sub-list to run only the first available formatter
			-- javascript = { { "prettierd", "prettier" } },
		},
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	})
end

return M
