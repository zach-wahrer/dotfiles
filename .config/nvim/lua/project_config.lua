require("project_nvim").setup()
require("telescope").load_extension("projects")
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>:Telescope projects<CR>", { noremap = true })
