local M = {
	"kamykn/spelunker.vim",
	dependencies = { "kamykn/popup-menu.nvim" },
	event = "VeryLazy",
}

function M.config()
	vim.g.spelunker_check_type = 2
end

return M
