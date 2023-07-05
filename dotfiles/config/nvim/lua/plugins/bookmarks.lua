local M = {
	"crusj/bookmarks.nvim",
	branch = "main",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	enabled = false,
	event = "VeryLazy",
}

function M.config()
	require("bookmarks").setup({
		keymap = {
			toggle = "<leader>b",
			add = "<leader>ba",
			delete = "bd",
			delete_on_virt = "<leader>bd",
			show_desc = "<leader>bs",
		},
		preview_ext_enable = true,
		virt_text = "󰃃",
	})
end

return M
