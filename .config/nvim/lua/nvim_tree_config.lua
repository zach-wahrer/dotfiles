vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>:NvimTreeToggle<CR>", { noremap = true })
vim.g.nvim_tree_highlight_opened_files = 3
vim.g.nvim_tree_git_hl = 1
require("nvim-tree").setup({
	open_on_setup = true,
	open_on_tab = true,
	-- auto_close = true,
	-- hijack_unnamed_buffer_when_opening = true,
	hijack_cursor = true,
	update_focused_file = {
		enable = true,
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},
	view = {
		width = 50,
		preserve_window_proportions = true,
		relativenumber = true,
	},
	git = {
		ignore = false
	},
	renderer = {
		indent_markers = {
			enable = true
		}
	}
})
