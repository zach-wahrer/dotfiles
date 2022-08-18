local opts = { noremap = true, silent = true }
local noremap = { noremap = true }
local set_keymap = vim.api.nvim_set_keymap

-- General Keybinds --
set_keymap("n", "<leader>w", "<cmd>w<CR>", opts) -- Write
set_keymap("n", "<A-Enter>", "O<ESC>", opts) -- Add line above
set_keymap("n", "<CR>", "o<ESC>", opts) -- Add line below
set_keymap("n", "<leader>a", "ggVG<CR>", opts) -- Select all
set_keymap("n", "<leader>id", "<cmd>put=strftime('%Y-%m-%d')<CR>", opts) -- Insert current date
set_keymap("n", "<C-W>|", "<C-W>t<C-W>H", opts) -- Change to vertical splits
set_keymap("n", "<C-W>-", "<C-W>t<C-W>K", opts) -- Change to horizontal splits
set_keymap("n", "<C-\\>", "<C-W><C-V>", opts) -- Vertical split
set_keymap("n", "<C-->", "<C-W><C-S>", opts) -- Horizontal split
set_keymap("n", "j", "gj", opts) -- Down on wrapped lines visually
set_keymap("n", "k", "gk", opts) -- Up on wrapped lines visually
set_keymap("v", "j", "gj", opts) -- Down on wrapped lines visually while selecting
set_keymap("v", "k", "gk", opts) -- Up on wrapped lines visually while selecting
set_keymap("n", "<ESC>", "<cmd>noh<CR>", opts) -- Remove search highlightingRemove search highlighting
set_keymap("n", "<leader>c", "<cmd>lclose<CR><cmd>cclose<CR>", opts) -- Close quickfix and location list
set_keymap("n", "<leader>df", "<cmd>vert diffsplit ", noremap) -- Diff an unopened file with the one currently open.
set_keymap("n", "<leader>dv", "<cmd>windo diffthis<CR>", noremap) -- Diff two windows
set_keymap("n", "<leader>dr", "<cmd>windo diffoff<CR>", noremap) -- Remove diff between windows
set_keymap("v", ">", ">gv", opts) -- Indent while keeping selection
set_keymap("v", "<", "<gv", opts) -- Remove indent while keeping selection
set_keymap("n", "<M-Up>", "<cmd>resize +2<CR>", opts) -- Resize horizontal split
set_keymap("n", "<M-Down>", "<cmd>resize -2<CR>", opts) -- Resize horizontal split
set_keymap("n", "<M-Left>", "<cmd>vertical resize -2<CR>", opts) -- Resize vertical split
set_keymap("n", "<M-Right>", "<cmd>vertical resize +2<CR>", opts) -- Resize vertical split
set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts) -- Move selected text down
set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts) -- Move selected text up
set_keymap("n", "<leader>n", "<cmd>enew<CR>", opts) -- New scratch buffer
set_keymap("n", "<leader>k", "<cmd>Telescope keymaps<CR>", opts) -- Search keymaps
-- set_keymap("n", "<leader>v", "<cmd>Telescope session-lens search_session<CR>", opts) -- Search keymaps
set_keymap("v", "<leader>64", "c<c-r>=system('base64 --decode', @\")<CR><ESC>", opts)

-- Dap --
set_keymap("n", "<leader>dt", "<cmd>lua require('dapui').toggle()<CR>", opts)
set_keymap("n", "<leader>dc", "<cmd>lua require('dap').continue()<CR>", opts)
set_keymap(
	"n",
	"<leader>dses",
	"<cmd>Dotenv deploy/local/.source.env | Dotenv deploy/local/.compiled.env | Dotenv ../../.secret.env <CR>",
	opts
)
set_keymap(
	"n",
	"<leader>dse",
	"<cmd>Dotenv deploy/local/.env | Dotenv deploy/local/.compiled.env | Dotenv ../../.secret.env <CR>",
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
set_keymap("n", "<leader>wq", "<cmd>w<CR><cmd>Bdelete<CR>", opts)
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
-- set_keymap("n", "<leader>v", "<cmd>Dashboard<CR>", opts)
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

-- Kommentary --
set_keymap("x", "<C-/>", "<Plug>kommentary_visual_default", opts)
set_keymap("n", "<C-/>", "<Plug>kommentary_line_default", opts)
--set_keymap("n", "<C-_>", "<Plug>kommentary_motion_default", opts)

-- Lazygit --
set_keymap("n", "<leader>lg", "<cmd>LazyGit<CR>", opts)

-- LSP -- Per client mappings are in lsp config file
set_keymap("n", "<leader>lsp", "<cmd>LspStop<CR><cmd>call wait(1000, 1==0)<CR><cmd>LspStart<CR>", opts)
set_keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
set_keymap("n", "<leader>dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
set_keymap("n", "<leader>dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
set_keymap("n", "<leader>dw", "<cmd>DiagWindowShow<CR>", opts)
set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
set_keymap("n", "<leader>ll", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

-- Neogen --
set_keymap("n", "<leader>ia", "<cmd>lua require('neogen').generate()<CR>", opts)

-- Nvim Tree --
set_keymap("n", "\\", "<cmd>NvimTreeToggle<CR>", opts)

-- Project --
set_keymap("n", "<leader>s", "<cmd>Telescope projects<CR>", opts)

-- Spectre --
set_keymap("n", "<leader>S", "<cmd>lua require('spectre').open()<CR>", opts)
set_keymap("n", "<leader>Sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", opts)
set_keymap("v", "<leader>Sw", "<ESC>:lua require('spectre').open_visual()<CR>", opts)

-- Telescope --
set_keymap("n", "<leader>r", "<cmd>Telescope oldfiles<CR>", opts)

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

-- Markdown --
set_keymap("n", "<leader>pm", "<cmd>MarkdownPreview<CR>", opts)
