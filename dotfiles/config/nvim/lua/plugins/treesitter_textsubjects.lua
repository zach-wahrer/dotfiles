local M = {
	"RRethy/nvim-treesitter-textsubjects",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	event = "VeryLazy",
}

function M.config()
	require("nvim-treesitter.configs").setup({
		textsubjects = {
			enable = true,
			prev_selection = ",", -- (Optional) keymap to select the previous selection
			keymaps = {
				["."] = "textsubjects-smart",
				[";"] = "textsubjects-container-outer",
				["i;"] = "textsubjects-container-inner",
			},
		},
	})
end

return M
