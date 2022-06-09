-- General Keybinds --
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true }) -- Write
vim.api.nvim_set_keymap("n", "<leader>p", '"0p', { noremap = true }) -- Paste last yanked text
vim.api.nvim_set_keymap("n", "<A-Enter>", "O<Esc>", { noremap = true }) -- Add line above
vim.api.nvim_set_keymap("n", "<CR>", "o<Esc>", { noremap = true }) -- Add line below
vim.api.nvim_set_keymap("n", "<leader>a", "ggVG<CR>", { noremap = true }) -- Select all
vim.api.nvim_set_keymap("n", "<leader>id", ":put=strftime('%Y-%m-%d')<CR>", { noremap = true }) -- Insert current date
vim.api.nvim_set_keymap("n", "<C-W>|", "<C-W>t<C-W>H", { noremap = true }) -- Change to vertical splits
vim.api.nvim_set_keymap("n", "<C-W>-", "<C-W>t<C-W>K", { noremap = true }) -- Change to horizontal splits
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true }) -- Down on wrapped lines visually
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true }) -- Up on wrapped lines visually
vim.api.nvim_set_keymap("n", "<ESC>", ":noh<CR>", { noremap = true, silent = true }) -- Remove search highlightingRemove search highlighting

-- Dap --
vim.api.nvim_set_keymap("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>dse",
	"<cmd>Dotenv deploy/local | Dotenv deploy/local/.compiled.env | Dotenv ../../.secret.env <CR>",
	{ noremap = true }
)
vim.api.nvim_set_keymap("n", "<leader>ds", "<cmd>lua require('dap').step_over()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>do", "<cmd>lua require('dap').step_out()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>dra", "<cmd>lua require('dap').clear_breakpoints()<CR>", { noremap = true })
vim.api.nvim_set_keymap(
	"n",
	"<leader>dj",
	"<cmd>lua require('jester').debug({dap = { console = ''}})<CR>",
	{ noremap = true }
)

-- Betterbuffer --
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>:Bdelete<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>1", "<cmd>:Bdelete!<CR>", { noremap = true })

-- GIT --
-- Diffview --
vim.api.nvim_set_keymap("n", "<leader>gv", "<cmd>DiffviewFileHistory<CR>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<leader>dvo", "<cmd>DiffviewOpen<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>gvc", "<cmd>DiffviewClose<CR>", { noremap = true })

-- Fugitive --
vim.api.nvim_set_keymap("n", "<leader>gb", "<cmd>Git blame<CR>", { noremap = true })

-- Lazygit --
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>:LazyGit<CR>", { noremap = true })
