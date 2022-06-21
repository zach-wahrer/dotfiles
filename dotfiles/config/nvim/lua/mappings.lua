local opts = { noremap = true, silent = true }
local set_keymap = vim.api.nvim_set_keymap

-- General Keybinds --
set_keymap("n", "<leader>w", ":w<CR>", opts) -- Write
set_keymap("n", "<leader>p", '"0p', opts) -- Paste last yanked text
set_keymap("n", "<A-Enter>", "O<Esc>", opts) -- Add line above
set_keymap("n", "<CR>", "o<Esc>", opts) -- Add line below
set_keymap("n", "<leader>a", "ggVG<CR>", opts) -- Select all
set_keymap("n", "<leader>id", ":put=strftime('%Y-%m-%d')<CR>", opts) -- Insert current date
set_keymap("n", "<C-W>|", "<C-W>t<C-W>H", opts) -- Change to vertical splits
set_keymap("n", "<C-W>-", "<C-W>t<C-W>K", opts) -- Change to horizontal splits
set_keymap("n", "j", "gj", opts) -- Down on wrapped lines visually
set_keymap("n", "k", "gk", opts) -- Up on wrapped lines visually
set_keymap("n", "<ESC>", ":noh<CR>", opts) -- Remove search highlightingRemove search highlighting
set_keymap("n", "<leader>c", ":lclose<CR>:cclose<CR>", opts) -- Close quickfix and location list

-- Dap --
set_keymap("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>", opts)
set_keymap("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>", opts)
set_keymap(
	"n",
	"<leader>dse",
	"<cmd>Dotenv deploy/local | Dotenv deploy/local/.compiled.env | Dotenv ../../.secret.env <CR>",
	opts
)
set_keymap("n", "<leader>ds", "<cmd>lua require('dap').step_over()<CR>", opts)
set_keymap("n", "<leader>di", "<cmd>lua require('dap').step_into()<CR>", opts)
set_keymap("n", "<leader>do", "<cmd>lua require('dap').step_out()<CR>", opts)
set_keymap("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", opts)
set_keymap("n", "<leader>dra", "<cmd>lua require('dap').clear_breakpoints()<CR>", opts)
set_keymap("n", "<leader>dj", "<cmd>lua require('jester').debug({dap = { console = ''}})<CR>", opts)

-- Betterbuffer --
set_keymap("n", "<leader>q", "<cmd>Bdelete<CR>", opts)
set_keymap("n", "<leader>1", "<cmd>Bdelete!<CR>", opts)

-- Bufferline --
set_keymap("n", "<A-h>", "<cmd>BufferLineCyclePrev<CR>", opts)
set_keymap("n", "<A-l>", "<cmd>BufferLineCycleNext<CR>", opts)
set_keymap("n", "<A-,>", "<cmd>BufferLineMovePrev<CR>", opts)
set_keymap("n", "<A-.>", "<cmd>BufferLineMoveNext<CR>", opts)
set_keymap("n", "<A-1>", "<cmd>BufferLineGoToBuffer 1<CR>", opts)
set_keymap("n", "<A-2>", "<cmd>BufferLineGoToBuffer 2<CR>", opts)
set_keymap("n", "<A-3>", "<cmd>BufferLineGoToBuffer 3<CR>", opts)
set_keymap("n", "<A-4>", "<cmd>BufferLineGoToBuffer 4<CR>", opts)
set_keymap("n", "<A-5>", "<cmd>BufferLineGoToBuffer 5<CR>", opts)
set_keymap("n", "<A-6>", "<cmd>BufferLineGoToBuffer 6<CR>", opts)
set_keymap("n", "<A-7>", "<cmd>BufferLineGoToBuffer 7<CR>", opts)
set_keymap("n", "<A-8>", "<cmd>BufferLineGoToBuffer 8<CR>", opts)
set_keymap("n", "<A-9>", "<cmd>BufferLineGoToBuffer 9<CR>", opts)
set_keymap("n", "<A-->", "<cmd>BufferLinePickClose<CR>", opts)

-- Dashboard --
set_keymap("n", "<leader>v", "<cmd>Dashboard<CR>", opts)
-- set_keymap("n", "<leader>ss", "<cmd>SessionSave<CR>", opts)
-- set_keymap("n", "<leader>sl", "<cmd>SessionLoad<CR>", opts)

-- Dial --
set_keymap("n", "<C-c>", require("dial.map").inc_normal(), opts)
set_keymap("n", "<C-x>", require("dial.map").dec_normal(), opts)

-- Diffview --
set_keymap("n", "<leader>gv", "<cmd>DiffviewFileHistory<CR>", opts)
-- set_keymap("n", "<leader>dvo", "<cmd>DiffviewOpen<CR>", opts)
set_keymap("n", "<leader>gvc", "<cmd>DiffviewClose<CR>", opts)

-- Fugitive --
set_keymap("n", "<leader>gb", "<cmd>Git blame<CR>", opts)

-- Harpoon --
set_keymap("n", "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<CR>", opts)
set_keymap("n", "<leader>h", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", opts)

-- Kommentary --
set_keymap("x", "<C-_>", "<Plug>kommentary_visual_default", opts)
set_keymap("n", "<C-_>", "<Plug>kommentary_line_default", opts)
--set_keymap("n", "<C-_>", "<Plug>kommentary_motion_default", opts)

-- Lazygit --
set_keymap("n", "<leader>lg", "<cmd>LazyGit<CR>", opts)

-- LSP -- Per client mappings are in lsp config file
set_keymap("n", "<leader>lsp", "<cmd>LspStop<CR><cmd>call wait(1000, 1==0)<CR><cmd>LspStart<CR>", opts)
set_keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
set_keymap("n", "<leader>ll", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Neogen --
set_keymap("n", "<leader>ia", ":lua require('neogen').generate()<CR>", opts)

-- Nvim Tree --
set_keymap("n", "\\", "<cmd>NvimTreeToggle<CR>", opts)

-- Project --
set_keymap("n", "<leader>s", "<cmd>Telescope projects<CR>", opts)

-- Undo Tree --
set_keymap("n", "<leader>u", "<cmd>UndotreeToggle<CR>", opts) -- Write

-- Vim Go --
set_keymap("n", "<leader>ggt", "<cmd>GoTests<CR>", opts)
set_keymap("n", "<leader>gat", "<cmd>GoAddTags<CR>", opts)
set_keymap("n", "<leader>gie", "<cmd>GoIfErr<CR>", opts)
set_keymap("n", "<leader>gc", "<cmd>GoCoverageToggle<CR>", opts)
set_keymap("n", "<leader>gf", "<cmd>GoFillStruct<CR>", opts)
set_keymap("n", "<leader>gt", "<cmd>GoTest<CR>", opts)
set_keymap("n", "<leader>ga", "<cmd>GoAlternate<CR>", opts)

-- Vim Test --
set_keymap("n", "<leader>tf", "<cmd>TestFile<CR>", opts)
set_keymap("n", "<leader>t", "<cmd>TestNearest<CR>", opts)
set_keymap("n", "<leader>tt", "<cmd>TestLast<CR>", opts)
