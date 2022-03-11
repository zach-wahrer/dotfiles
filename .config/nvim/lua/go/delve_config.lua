vim.g.delve_new_command = "new"
vim.api.nvim_set_keymap("n", "<leader>db", "<cmd>:DlvToggleBreakpoint<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dt", "<cmd>:DlvTest<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dd", "<cmd>:DlvDebug<CR>", { noremap = true })
