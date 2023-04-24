local M = {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"s1n7ax/nvim-window-picker",
	},
}

function M.config()
	-- If you want icons for diagnostic errors, you'll need to define them somewhere:
	vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
	vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
	vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
	vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
	-- NOTE: this is changed from v1.x, which used the old style of highlight groups
	-- in the form "LspDiagnosticsSignWarning"

	require("neo-tree").setup({
		source_selector = {
			winbar = true,
		},
		use_popups_for_input = false,
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
				hide_gitignored = false,
			},
			window = {
				mappings = {
					["o"] = "system_open",
				},
			},
			commands = {
				system_open = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					vim.api.nvim_command(string.format("silent !xdg-open '%s'", path))
				end,
			},
			use_libuv_file_watcher = true,
		},
	})
end

return M
