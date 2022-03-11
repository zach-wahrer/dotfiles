vim.g["test#go#runner"] = "richgo"
vim.g["test#strategy"] = "vimux"
vim.api.nvim_set_keymap("n", "<leader>tf", "<cmd>:TestFile<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>:TestNearest<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>tt", "<cmd>:TestLast<CR>", { noremap = true })
