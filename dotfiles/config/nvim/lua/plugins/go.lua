local M = {
	"ray-x/go.nvim",
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		"rcarriga/nvim-dap-ui",
	},
	event = { "CmdlineEnter" },
	ft = { "go", "gomod" },
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
}

function M.config()
	require("go").setup({
		icons = { breakpoint = "", currentpos = "" },
		dap_debug_keymap = false,
		dap_debug_vt = false,
		lsp_config = false,
		lsp_keymaps = false,
		lsp_inlay_hints = {
			enable = false,
		},
		luasnip = true,
		test_runner = "richgo",
		-- run_in_floaterm = true,
		-- floaterm = {
		-- 	posititon = "bottom", -- one of {`top`, `bottom`, `left`, `right`, `center`, `auto`}
		-- 	width = 0.98, -- width of float window if not auto
		-- 	height = 0.2, -- height of float window if not auto
		-- },
	})
end

return M
