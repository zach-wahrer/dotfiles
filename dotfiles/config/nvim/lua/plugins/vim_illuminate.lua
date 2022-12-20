local M = {
	"RRethy/vim-illuminate",
}

function M.config()
	require("illuminate").configure({
		filetypes_denylist = {
			"neo-tree",
			"dirvish",
			"fugitive",
		},
	})
end

return M
