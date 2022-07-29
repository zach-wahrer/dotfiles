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
		centralize_selection = true,
	},
	git = {
		ignore = false,
	},
	renderer = {
		indent_markers = {
			enable = true,
		},
		highlight_opened_files = "all",
		highlight_git = true,
		special_files = {},
	},
	filesystem_watchers = {
		enable = true,
	},
})
