local M = {
	"vim-test/vim-test",
	event = "VeryLazy",
}

function M.config()
	vim.g["test#go#runner"] = "richgo"
	vim.g["test#strategy"] = "kitty"
end

return M
