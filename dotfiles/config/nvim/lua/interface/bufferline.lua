require("bufferline").setup({
	options = {
		max_name_length = 50,
		diagnostics = "nvim_lsp",
		offsets = {
			{
				filetype = "NvimTree",
				text = "",
				highlight = "Directory",
				text_align = "left",
			},
		},
		close_command = "Bdelete! %d",
		right_mouse_command = "vertical sbuffer %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = "Bdelete! %d",
	},
})
vim.api.nvim_set_keymap("n", "<A-h>", "<cmd>BufferLineCyclePrev<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-l>", "<cmd>BufferLineCycleNext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-,>", "<cmd>BufferLineMovePrev<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-.>", "<cmd>BufferLineMoveNext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-1>", "<cmd>BufferLineGoToBuffer 1<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-2>", "<cmd>BufferLineGoToBuffer 2<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-3>", "<cmd>BufferLineGoToBuffer 3<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-4>", "<cmd>BufferLineGoToBuffer 4<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-5>", "<cmd>BufferLineGoToBuffer 5<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-6>", "<cmd>BufferLineGoToBuffer 6<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-7>", "<cmd>BufferLineGoToBuffer 7<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-8>", "<cmd>BufferLineGoToBuffer 8<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-9>", "<cmd>BufferLineGoToBuffer 9<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-->", "<cmd>BufferLinePickClose<CR>", { noremap = true })
