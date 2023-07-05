local M = {
	"RRethy/vim-illuminate",
	event = "VeryLazy",
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
