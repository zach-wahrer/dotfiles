local opts = { noremap = true, silent = true }
local noremap = { noremap = true }
local set_keymap = vim.api.nvim_set_keymap
local set_vim_keymap = vim.keymap.set
-- vim.keymap.set({"n","x"}, "p", "<CMD><CR>")

-- General Keybinds --
set_vim_keymap("n", "<leader>n", "<CMD>enew<CR>", { desc = "Open new scratch buffer", noremap = true, silent = true })
set_vim_keymap("n", "<leader>w", "<CMD>w<CR>", { desc = "Write file", noremap = true, silent = true })
set_vim_keymap("n", "<leader>a", "ggVG<CR>", { desc = "Select all", noremap = true, silent = true })
set_vim_keymap(
	"n",
	"<leader>sc",
	"<CMD>lua require('functions').toScratch()<CR>",
	{ desc = "Send output of command to scratch buffer", noremap = true, silent = true }
)
set_vim_keymap({ "n", "v", "i" }, "<S-Up>", "", { desc = "Disable shift up", noremap = true, silent = true })
set_vim_keymap({ "n", "v", "i" }, "<S-Down>", "", { desc = "Disable shift down", noremap = true, silent = true })

set_vim_keymap(
	"n",
	"<leader>o",
	"<CMD>only<CR>",
	{ desc = "Close all windows but current", noremap = true, silent = true }
)
set_vim_keymap("n", "<leader>wo", "<CMD>set wrap<CR>", { desc = "Wrap text", noremap = true, silent = true })

set_vim_keymap({ "n", "v" }, "H", "_", { desc = "Beginning of line", noremap = true, silent = true })
set_vim_keymap({ "n", "v" }, "L", "$", { desc = "End of line", noremap = true, silent = true })

set_vim_keymap(
	"n",
	"<leader>cs",
	"<CMD>lua require('functions').toggleCenterScroll()<CR>",
	{ desc = "Toggle keeping cursor in center of screen", noremap = true, silent = true }
)

set_vim_keymap("n", "<A-Enter>", "O<ESC>", { desc = "Add line above", noremap = true, silent = true })
set_vim_keymap("n", "<CR>", "o<ESC>", { desc = "Add line below", noremap = true, silent = true })

set_vim_keymap("n", "<C-Space>", "ciw", { desc = "Change inner word", noremap = true, silent = true })
set_vim_keymap("n", "<C-Enter>", 'ci"', { desc = "Change inner quote", noremap = true, silent = true })

set_vim_keymap(
	"n",
	"<leader>ek",
	"<CMD>lua require('functions').exportColorsKitty()<CR>",
	{ desc = "Export colors for kitty terminal", noremap = true, silent = true }
)

set_vim_keymap(
	"n",
	"<leader>id",
	"<CMD>put=strftime('%Y-%m-%d')<CR>",
	{ desc = "Insert current date", noremap = true, silent = true }
)
set_vim_keymap(
	"v",
	"<leader>d64",
	"c<c-r>=system('base64 --decode', @\")<CR><ESC>",
	{ desc = "Base64 decode string", noremap = true, silent = true }
)
set_vim_keymap(
	"v",
	"<leader>e64",
	"c<c-r>=system('base64', @\")<CR><ESC>",
	{ desc = "Base64 decode string", noremap = true, silent = true }
)

-- Tab Keybinds --
set_vim_keymap("n", "<leader>tn", "<CMD>tabnew<CR>", { desc = "New tab page", noremap = true, silent = true })
set_vim_keymap("n", "<CA-h>", "<CMD>tabp<CR>", { desc = "Previous tab page", noremap = true, silent = true })
set_vim_keymap("n", "<CA-l>", "<CMD>tabn<CR>", { desc = "Next tab page", noremap = true, silent = true })

-- Quickfix Keybinds --
set_vim_keymap(
	"n",
	"<leader>c",
	"<CMD>lclose<CR><CMD>cclose<CR>",
	{ desc = "Close quickfix and location list", noremap = true, silent = true }
)
set_vim_keymap("n", "<leader>cn", "<CMD>cn<CR>", { desc = "Goto next quickfix item", noremap = true, silent = true })
set_vim_keymap(
	"n",
	"<leader>cp",
	"<CMD>cp<CR>",
	{ desc = "Goto previous quick fix item", noremap = true, silent = true }
)
set_vim_keymap(
	"n",
	"<leader>co",
	"<CMD>lua require('functions').openAllQuickFix()<CR>",
	{ desc = "Open all quick fix list into buffers", noremap = true, silent = true }
)

-- Find Keybinds --
set_vim_keymap(
	"n",
	"<leader>od",
	"<CMD>lua require('functions').findFiles('~/dotfiles')<CR>",
	{ desc = "Find in dotfiles", noremap = true, silent = true }
)
set_vim_keymap(
	"n",
	"<leader>ok",
	"<CMD>lua require('functions').findFiles('~/dotfiles/dotfiles/config/kitty')<CR>",
	{ desc = "Find in kitty files", noremap = true, silent = true }
)
set_vim_keymap(
	"n",
	"<leader>oz",
	"<CMD>lua require('functions').findFiles('~/dotfiles/dotfiles/config/zsh')<CR>",
	{ desc = "Find in zsh files", noremap = true, silent = true }
)
set_vim_keymap(
	"n",
	"<leader>on",
	"<CMD>lua require('functions').findFiles('~/.config/nvim')<CR>",
	{ desc = "Find in nvim files", noremap = true, silent = true }
)
set_vim_keymap(
	"n",
	"<leader>os",
	"<CMD>lua require('functions').findFiles('~/.config/sway')<CR>",
	{ desc = "Find in sway files", noremap = true, silent = true }
)
set_vim_keymap(
	"n",
	"<leader>og",
	"<CMD>lua require('functions').findFiles('~/go/src')<CR>",
	{ desc = "Find in go src files", noremap = true, silent = true }
)
set_vim_keymap(
	"n",
	"<leader>ob",
	"<CMD>lua require('functions').findFiles('~/Brainhole')<CR>",
	{ desc = "Find in note files", noremap = true, silent = true }
)

-- Scroll Keybinds --
set_vim_keymap(
	{ "n", "v" },
	"j",
	"<CMD>lua require('functions').scroll('gj')<CR>",
	{ desc = "Down on wrapped lines visually", noremap = true, silent = true }
)
set_vim_keymap(
	{ "n", "v" },
	"k",
	"<CMD>lua require('functions').scroll('gk')<CR>",
	{ desc = "Up on wrapped lines visually", noremap = true, silent = true }
)
set_vim_keymap("n", "n", "nzz", { desc = "Center cursor after search jump", noremap = true, silent = true })
set_vim_keymap("n", "N", "Nzz", { desc = "Center cursor after search jump", noremap = true, silent = true })

-- Indent Keybinds --
set_vim_keymap("v", ">", ">gv", { desc = "Indent while keeping selection", noremap = true, silent = true })
set_vim_keymap("v", "<", "<gv", { desc = "Remove indent while keeping selection", noremap = true, silent = true })

-- Split Keybinds --
set_vim_keymap("n", "<C-W>|", "<C-W>t<C-W>H", { desc = "Change to vertical splits", noremap = true, silent = true })
set_vim_keymap("n", "<C-W>-", "<C-W>t<C-W>K", { desc = "Change to horizontal splits", noremap = true, silent = true })
set_vim_keymap("n", "<C-\\>", "<C-W><C-V>", { desc = "Vertical split", noremap = true, silent = true })
set_vim_keymap("n", "<C-->", "<C-W><C-S>", { desc = "Horizontal split", noremap = true, silent = true })
set_vim_keymap(
	"n",
	"<M-Up>",
	"<CMD>resize +2<CR>",
	{ desc = "Resize horizontal split bigger", noremap = true, silent = true }
)
set_vim_keymap(
	"n",
	"<M-Down>",
	"<CMD>resize -2<CR>",
	{ desc = "Resize horizontal split smaller", noremap = true, silent = true }
)
set_vim_keymap(
	"n",
	"<M-Left>",
	"<CMD>vertical resize -2<CR>",
	{ desc = "Resize vertical split smaller", noremap = true, silent = true }
)
set_vim_keymap(
	"n",
	"<M-Right>",
	"<CMD>vertical resize +2<CR>",
	{ desc = "Resize vertical split bigger", noremap = true, silent = true }
)

-- Diff Keybinds --
set_vim_keymap(
	"n",
	"<leader>df",
	"<CMD>lua require('functions').diffOpenFileToggle()<CR>",
	{ desc = "Diff an unopened file with the one currently open", noremap = true }
)
set_vim_keymap(
	"n",
	"<leader>dv",
	"<CMD>lua require('functions').diffToggle()<CR>",
	{ desc = "Toggle diff", noremap = true }
)

-- Search Keybinds --
set_vim_keymap(
	"n",
	"<ESC>",
	"<CMD>lua require('functions').removeSearch()<CR>",
	{ desc = "Remove search highlighting", noremap = true, silent = true }
)
set_vim_keymap(
	"n",
	"*",
	"<CMD>lua require('functions').searchWordUnderCursorForward()<CR>",
	{ desc = "Improved forward search", noremap = true, silent = true }
)
set_vim_keymap(
	"n",
	"#",
	"<CMD>lua require('functions').searchWordUnderCursorBackward()<CR>",
	{ desc = "Improved backward search", noremap = true, silent = true }
)

-- Bufferline --
set_keymap("n", "<A-h>", "<CMD>BufferLineCyclePrev<CR>", opts)
set_keymap("n", "<A-l>", "<CMD>BufferLineCycleNext<CR>", opts)
set_keymap("n", "<A-,>", "<CMD>BufferLineMovePrev<CR>", opts)
set_keymap("n", "<A-.>", "<CMD>BufferLineMoveNext<CR>", opts)

-- Dap --
set_keymap("n", "<leader>dt", "<CMD>lua require('dapui').toggle()<CR>", opts)
set_keymap("n", "<leader>d", "<CMD>lua require('dap').continue()<CR>", opts)
set_keymap("n", "<leader>dse", "<CMD>lua require('functions').debugSetEnvironment()<CR>", opts)
set_keymap("n", "<leader>ds", "<CMD>lua require('dap').step_over()<CR>", opts)
set_keymap("n", "<leader>di", "<CMD>lua require('dap').step_into()<CR>", opts)
set_keymap("n", "<leader>do", "<CMD>lua require('dap').step_out()<CR>", opts)
set_keymap("n", "<leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>", opts)
set_keymap("n", "<leader>dra", "<CMD>lua require('dap').clear_breakpoints()<CR>", opts)
set_keymap("n", "<leader>dj", "<CMD>lua require('jester').debug({dap = { console = ''}})<CR>", opts)

-- Dial --
local dialOK, dialMap = pcall(require, "dial.map")
if dialOK then
	set_keymap("n", "<C-c>", dialMap.inc_normal(), opts)
	set_keymap("n", "<C-x>", dialMap.dec_normal(), opts)
end

-- Diffview --
set_keymap("n", "<leader>gv", "<CMD>lua require('functions').gitDiffToggle()<CR>", opts)

-- Flash --
set_keymap("n", "<Backspace>", "<CMD>lua require('flash').jump()<CR>", opts)
set_keymap("n", "<leader><Backspace>", "<CMD>lua require('flash').treesitter()<CR>", opts)

-- Fugitive --
set_keymap("n", "<leader>gb", "<CMD>Git blame<CR>", opts)

-- GitLinker --
set_vim_keymap(
	{ "n", "v" },
	"<leader>gl",
	"<CMD>lua require('gitlinker').link({action = require('gitlinker.actions').clipboard})<CR>",
	opts
)
set_vim_keymap(
	{ "n", "v" },
	"<leader>gL",
	"<CMD>lua require('gitlinker').link({action = require('gitlinker.actions').system})<CR>",
	opts
)

-- GitMessenger --
set_keymap("n", "<leader>gd", "<CMD>GitMessenger<CR>", opts)

-- Gitsigns --
set_keymap("n", "<leader>hs", "<CMD>Gitsigns stage_hunk<CR>", opts)
set_keymap("n", "<leader>hu", "<CMD>Gitsigns undo_stage_hunk<CR>", opts)
set_keymap("n", "<leader>hr", "<CMD>Gitsigns reset_hunk<CR>", opts)
set_keymap("n", "<leader>hS", "<CMD>Gitsigns stage_buffer<CR>", opts)
set_keymap("n", "<leader>hR", "<CMD>Gitsigns reset_buffer<CR>", opts)
set_keymap("n", "<leader>hP", "<CMD>Gitsigns preview_hunk<CR>", opts)
set_keymap("n", "<leader>hp", "<CMD>Gitsigns prev_hunk<CR>", opts)
set_keymap("n", "<leader>hn", "<CMD>Gitsigns next_hunk<CR>", opts)

-- LSP -- Per client mappings are in lsp config file
set_keymap("n", "<leader>lsp", "<CMD>LspStop<CR><CMD>call wait(1500, 1==0)<CR><CMD>LspStart<CR>", opts)
set_keymap("n", "<leader>m", "<CMD>lua vim.diagnostic.open_float()<CR>", opts)
set_keymap("n", "<leader>dw", "<CMD>DiagWindowShow<CR>", opts)
set_keymap("n", "<leader>dn", "<CMD>lua vim.diagnostic.goto_next()<CR>", opts)
set_keymap("n", "<leader>dp", "<CMD>lua vim.diagnostic.goto_prev()<CR>", opts)
set_keymap("n", "<leader>ll", "<CMD>lua vim.diagnostic.setloclist()<CR>", opts)

-- Markdown --
set_keymap("n", "<leader>mp", "<CMD>MarkdownPreview<CR>", opts)

-- Mini.map --
set_keymap("n", "<Delete>", "<CMD>lua MiniMap.toggle()<CR>", opts)
set_keymap("n", "<Delete><Delete>", "<CMD>lua MiniMap.toggle_focus()<CR>", opts)

-- Neogen --
set_keymap("n", "<leader>ia", "<CMD>lua require('neogen').generate()<CR>", opts)
set_keymap("n", "<leader>ifa", "<CMD>lua require('neogen').generate({})<CR>", opts)
set_keymap("n", "<leader>ita", "<CMD>lua require('neogen').generate({type = 'type'})<CR>", opts)

-- NeoZoom
set_keymap("n", "<leader><CR>", "<CMD>NeoZoomToggle<CR>", opts)

-- Notify --
set_keymap("n", "<leader>mr", "<CMD>lua require('notify').dismiss()<CR>", opts)

-- Neo Tree --
set_keymap("n", ";", "<CMD>Neotree filesystem toggle<CR>", opts)
set_keymap("n", "'", "<CMD>Neotree buffers toggle<CR>", opts)
set_keymap("n", "\\", "<CMD>Neotree reveal<CR>", opts)

-- Possession --
local pOK, possession = pcall(require, "nvim-possession")
if pOK then
	vim.keymap.set("n", "<leader>sl", function()
		possession.list()
	end)
	vim.keymap.set("n", "<leader>sn", function()
		possession.new()
	end)
	vim.keymap.set("n", "<leader>su", function()
		possession.update()
	end)
end

-- Sad --
set_keymap("n", "<leader>sr", "<CMD>Sad<CR>", opts)

-- Telescope --
set_keymap("n", "<leader>r", "<CMD>Telescope oldfiles<CR>", opts)
set_keymap("n", "<leader>s", "<CMD>Telescope live_grep hidden=true<CR>", opts)
set_keymap("n", "<leader>ff", "<CMD>Telescope find_files hidden=true<CR>", opts)
set_keymap("n", "<leader>h", "<CMD>Telescope help_tags<CR>", opts)
set_keymap("n", "<leader>ss", "<CMD>Telescope grep_string<CR>", opts)
set_keymap("n", "<leader>k", "<CMD>Telescope keymaps<CR>", opts)
set_keymap("n", "<leader>ls", "<CMD>Telescope luasnip<CR>", opts)
set_keymap("n", "<leader>e", "<CMD>Telescope env<CR>", opts)
set_keymap("n", "<leader>sf", "<CMD>GrepInDirectory<CR>", opts)
set_keymap("n", "<leader>fd", "<CMD>FileInDirectory<CR>", opts)
set_keymap("n", "<leader>p", "<CMD>Telescope lazy<CR>", opts)
set_keymap("n", "<leader>mo", "<CMD>Telescope notify<CR>", opts)
set_keymap("n", "<leader>u", "<CMD>Telescope undo<CR>", opts)
set_keymap("n", "<leader>g", "<CMD>Telescope advanced_git_search show_custom_functions<CR>", opts)

-- Vim Bbye --
set_keymap("n", "<leader>q", "<CMD>Bdelete<CR>", opts)
set_keymap("n", "<leader>wq", "<CMD>w<CR><CMD>Bdelete<CR>", opts)
set_keymap("n", "<leader>1", "<CMD>Bdelete!<CR>", opts)

-- Vim Go --
set_keymap("n", "<leader>gt", "<CMD>GoTests<CR>", opts)
set_keymap("n", "<leader>gat", "<CMD>GoAddTags<CR>", opts)
set_keymap("n", "<leader>gc", "<CMD>GoCoverageToggle<CR>", opts)
set_keymap("n", "<leader>gf", "<CMD>GoFillStruct<CR>", opts)
set_keymap("n", "<leader>ga", "<CMD>GoAlternate<CR>", opts)
-- set_keymap("n", "<leader>gl", "<CMD>lua require('functions').toggleGoMetalinterOnSave()<CR>", opts)

-- Vim Test --
set_keymap("n", "<leader>tf", "<CMD>TestFile<CR>", opts)
set_keymap("n", "<leader>t", "<CMD>TestNearest<CR>", opts)
set_keymap("n", "<leader>tt", "<CMD>TestLast<CR>", opts)
