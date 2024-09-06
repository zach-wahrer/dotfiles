local M = {
	"mfussenegger/nvim-lint",
}

function M.config()
	local lint = require("lint")
	lint.linters_by_ft = {
		-- go = { "golangcilint" },
		sh = { "shellcheck" },
		zsh = { "zsh" },
		terraform = { "tflint" },
		tf = { "tflint" },
		javascript = { "deno" },
		json = { "deno" },
		markdown = { "deno" },
		typescript = { "deno" },
		lua = { "luacheck" },
		luau = { "luacheck" },
		python = { "ruff" },
	}

	vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
		group = vim.api.nvim_create_augroup("lint", { clear = true }),
		callback = function()
			lint.try_lint()
			lint.try_lint("codespell")
		end,
	})
end

return M
