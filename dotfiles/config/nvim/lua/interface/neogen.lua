local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>ia", ":lua require('neogen').generate()<CR>", opts)
require("neogen").setup({})
