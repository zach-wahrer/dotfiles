vim.g.go_addtags_transform = "camelcase"
vim.api.nvim_set_keymap("n", "<leader>ggt", "<cmd>GoTests<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gat", "<cmd>GoAddTags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gai", "<cmd>GoIfErr<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>GoCoverageToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>GoFillStruct<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>GoTest<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ga", "<cmd>GoAlternate<CR>", { noremap = true })
