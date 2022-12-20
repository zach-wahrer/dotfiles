local M = {
	"zbirenbaum/neodim",
}

function M.config()
	require("neodim").setup({
		alpha = 0.5,
		blend_color = "#000000",
		update_in_insert = {
			enable = true,
			delay = 100,
		},
		hide = {
			virtual_text = false,
			signs = false,
			underline = false,
		},
	})
end

return M
