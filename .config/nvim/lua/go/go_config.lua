vim.g.go_addtags_transform = "camelcase"
vim.api.nvim_set_keymap("n", "<leader>ggt", "<cmd>GoTests<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gat", "<cmd>GoAddTags<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gai", "<cmd>GoIfErr<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gc", "<cmd>GoCoverageToggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gf", "<cmd>GoFillStruct<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gt", "<cmd>GoTest<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ga", "<cmd>GoAlternate<CR>", { noremap = true })

vim.g["go_metalinter_autosave_enabled"] = {'gofmt', 'govet', 'revive', 'errcheck', 'deadcode', 'gosimple', 'ineffassign', 'staticcheck', 'structcheck', 'typecheck','unused', 'varcheck', 'bodyclose', 'dogsled', 'goconst', 'gocyclo', 'importas', 'rowserrcheck', 'sqlclosecheck', 'misspell', 'gosec'}
vim.g["go_metalinter_command"] = 'golangci-lint'
vim.g["go_metalinter_autosave"] = 1
vim.g["go_fmt_command"] = 'goimports'
vim.g["go_fmt_autosave"] = 1
vim.g["go_mod_fmt_autosave"] = 1
vim.g["go_imports_autosave"] = 1
