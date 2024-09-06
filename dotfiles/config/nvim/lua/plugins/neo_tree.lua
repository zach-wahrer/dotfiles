local M = {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"kyazdani42/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"s1n7ax/nvim-window-picker",
	},
	event = "VeryLazy",
}

function M.config()
	-- If you want icons for diagnostic errors, you'll need to define them somewhere:
	-- vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
	-- vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
	-- vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
	-- vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
	-- NOTE: this is changed from v1.x, which used the old style of highlight groups
	-- in the form "LspDiagnosticsSignWarning"

	require("neo-tree").setup({
		source_selector = {
			winbar = true,
			sources = {
				{ source = "filesystem", display_name = " 󰉓  Files " },
				{ source = "buffers", display_name = " 󰈙  Buffers " },
				{ source = "git_status", display_name = " 󰊢  Git " },
			},
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
				auto_expand_width = true,
			},
			commands = {
				system_open = function(state)
					local node = state.tree:get_node()
					local path = node:get_id()
					vim.api.nvim_command(string.format("silent !xdg-open '%s'", path))
				end,
			},
			-- use_libuv_file_watcher = true,
		},
		default_component_configs = {
			name = {
				highlight_opened_files = true,
			},
			icon = {
				folder_empty = "󰜌",
				folder_empty_open = "󰜌",
			},
			git_status = {
				symbols = {
					renamed = "󰁕",
					unstaged = "󰄱",
				},
			},
		},
		document_symbols = {
			kinds = {
				File = { icon = "󰈙", hl = "Tag" },
				Namespace = { icon = "󰌗", hl = "Include" },
				Package = { icon = "󰏖", hl = "Label" },
				Class = { icon = "󰌗", hl = "Include" },
				Property = { icon = "󰆧", hl = "@property" },
				Enum = { icon = "󰒻", hl = "@number" },
				Function = { icon = "󰊕", hl = "Function" },
				String = { icon = "󰀬", hl = "String" },
				Number = { icon = "󰎠", hl = "Number" },
				Array = { icon = "󰅪", hl = "Type" },
				Object = { icon = "󰅩", hl = "Type" },
				Key = { icon = "󰌋", hl = "" },
				Struct = { icon = "󰌗", hl = "Type" },
				Operator = { icon = "󰆕", hl = "Operator" },
				TypeParameter = { icon = "󰊄", hl = "Type" },
				StaticMethod = { icon = "󰠄 ", hl = "Function" },
			},
		},
	})
end

return M
