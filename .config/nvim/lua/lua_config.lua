local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<leader>fl", [[<cmd>lua require("stylua-nvim").format_file()<CR>]], opts)
--- Doesn't work: vim.api.nvim_exec([[autocmd BufWritePre *.lua lua require("stylua-nvim").format_file()<CR>]], false)
