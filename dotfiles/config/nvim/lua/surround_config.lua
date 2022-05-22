require("surround").setup({
	load_keymaps = false,
})

vim.api.nvim_set_keymap("v", "as", "<esc>gv<cmd>lua require('surround').surround_add(false)<cr>", { noremap = true }) -- Add surrounds
vim.api.nvim_set_keymap("n", "ds", "<cmd>lua require('surround').surround_delete()<cr>", { noremap = true }) -- Delete surrounds
vim.api.nvim_set_keymap("n", "rs", "<cmd>lua require('surround').surround_replace()<cr>", { noremap = true }) -- Replace surrounds
