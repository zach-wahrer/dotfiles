local M = {
	"nathom/filetype.nvim",
}

function M.config()
	local ok, _ = pcall(require, "filetype")
	if not ok then
		return
	end

	-- Do not source the default filetype.vim
	vim.g.did_load_filetypes = 1
end

return M
