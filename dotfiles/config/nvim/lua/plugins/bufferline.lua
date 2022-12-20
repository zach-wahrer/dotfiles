local M = {
	"akinsho/bufferline.nvim",
	dependencies = "kyazdani42/nvim-web-devicons",
}

function M.config()
	Colors = require("colors")
	require("bufferline").setup({
		options = {
			max_name_length = 50,
			max_prefix_length = 20,
			truncate_names = false,
			separator_style = "slant",
			diagnostics = "nvim_lsp",
			sort_by = "directory",
			offsets = {
				{
					filetype = "neo-tree",
					text = "",
					highlight = "Directory",
					text_align = "left",
				},
			},
			close_command = "Bdelete! %d",
			right_mouse_command = "vertical sbuffer %d",
			left_mouse_command = "buffer %d",
			middle_mouse_command = "Bdelete! %d",
		},
		highlights = {
			tab_selected = {
				fg = Colors.green,
			},
			buffer_selected = {
				fg = Colors.green,
				bold = true,
				italic = true,
			},
		},
	})
end

return M
