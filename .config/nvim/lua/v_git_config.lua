require("vgit").setup({
	keymaps = {
		["n <C-k>"] = "hunk_up",
		["n <C-j>"] = "hunk_down",
		["n <A-b>"] = "buffer_gutter_blame_preview",
		["n <A-h>"] = "buffer_history_preview",
	},
})
