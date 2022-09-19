require("lint").linters_by_ft = {
	markdown = { "vale", "markdownlint" },
	yaml = { "yamllint" },
	json = { "eslint" },
	zsh = { "shellcheck" },
	szshh = { "shellcheck" },
	javascript = { "eslint" },
	go = { "golangcilint" },
	gomod = { "golangcilint" },
	typescript = { "eslint" },
	vue = { "eslint" },
	python = { "flake8", "pylint" },
	lua = { "luacheck" },
}
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
