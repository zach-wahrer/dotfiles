require("trouble").setup({
	height = 5,
	use_diagnostic_signs = true,
})
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble document_diagnostics<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gr", "<cmd>Trouble lsp_references<CR>", { noremap = true })
