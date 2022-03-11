local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>fl", [[<cmd>lua require("stylua-nvim").format_file()<CR>]], opts)
