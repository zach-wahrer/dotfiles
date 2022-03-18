require("vgit").setup({
	keymaps = {
		["n <C-k>"] = "hunk_up",
		["n <C-j>"] = "hunk_down",
		["n <leader>dlb"] = "buffer_gutter_blame_preview",
		["n <leader>dfh"] = "buffer_history_preview",
	}
})
