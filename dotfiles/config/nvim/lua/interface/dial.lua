vim.api.nvim_set_keymap("n", "<C-C>", require("dial.map").inc_normal(), { noremap = true })
vim.api.nvim_set_keymap("n", "<C-X>", require("dial.map").dec_normal(), { noremap = true })
