require("vgit").setup({
	keymaps = {
		["n <leader>dlb"] = "buffer_gutter_blame_preview",
		["n <leader>dfh"] = "buffer_history_preview",
	}
})
vim.wo.signcolumn = 'yes'
