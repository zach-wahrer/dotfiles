require("project_nvim").setup()
require("telescope").load_extension("projects")
vim.api.nvim_set_keymap("n", "<C-F>", "<cmd>:Telescope projects<CR>", { noremap = true })
