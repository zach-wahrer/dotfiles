local function set_vim_keymap(modes, lhs, rhs, desc)
	vim.keymap.set(modes, lhs, rhs, { desc = desc, noremap = true, silent = true })
end

-- General Keybinds --
set_vim_keymap("n", "<leader>n", "<CMD>enew<CR>", "Open new scratch buffer")
set_vim_keymap("n", "<leader>w", "<CMD>w<CR>", "Write file")
set_vim_keymap("n", "<leader>a", "ggVG<CR>", "Select all")
set_vim_keymap(
	"n",
	"<leader>sc",
	"<CMD>lua require('functions').toScratch()<CR>",
	"Send output of command to scratch buffer"
)
set_vim_keymap({ "n", "v", "i" }, "<S-Up>", "", "Disable shift up")
set_vim_keymap({ "n", "v", "i" }, "<S-Down>", "", "Disable shift down")

set_vim_keymap("n", "<leader>o", "<CMD>only<CR>", "Close all windows but current")
set_vim_keymap("n", "<leader>wo", "<CMD>set wrap!<CR>", "Wrap text toggle")

set_vim_keymap({ "n", "v" }, "H", "_", "Beginning of line")
set_vim_keymap({ "n", "v" }, "L", "$", "End of line")

set_vim_keymap(
	"n",
	"<leader>cs",
	"<CMD>lua require('functions').toggleCenterScroll()<CR>",
	"Toggle keeping cursor in center of screen"
)

set_vim_keymap("n", "<A-Enter>", "O<ESC>", "Add line above")
set_vim_keymap("n", "<CR>", "o<ESC>", "Add line below")

-- Format Keybinds --
set_vim_keymap("n", "<leader>id", "<CMD>put=strftime('%Y-%m-%d')<CR>", "Insert current date")
set_vim_keymap("n", "<leader>iu", "<CMD>put=system('uuidgen')<CR>", "Insert UUID")
set_vim_keymap("v", "<leader>d64", "c<c-r>=system('base64 --decode', @\")<CR><ESC>", "Base64 decode string")
set_vim_keymap("v", "<leader>e64", "c<c-r>=system('base64', @\")<CR><ESC>", "Base64 decode string")
set_vim_keymap("n", "<leader>jq", "<CMD>%!jq -S .<CR>", "Format current buffer with JQ")

-- Tab Keybinds --
set_vim_keymap("n", "<leader>tn", "<CMD>tabnew<CR>", "New tab page")
set_vim_keymap("n", "<leader>tc", "<CMD>tabclose<CR>", "Close tab page")
set_vim_keymap("n", "<A-y>", "<CMD>tabp<CR>", "Previous tab page")
set_vim_keymap("n", "<A-o>", "<CMD>tabn<CR>", "Next tab page")

-- Quickfix Keybinds --
set_vim_keymap("n", "<leader>c", "<CMD>lclose<CR><CMD>cclose<CR>", "Close quickfix and location list")
set_vim_keymap("n", "<leader>cn", "<CMD>cn<CR>", "Goto next quickfix item")
set_vim_keymap("n", "<leader>cp", "<CMD>cp<CR>", "Goto previous quick fix item")
set_vim_keymap(
	"n",
	"<leader>co",
	"<CMD>lua require('functions').openAllQuickFix()<CR>",
	"Open all quick fix list into buffers"
)

-- Find Keybinds --
set_vim_keymap("n", "<leader>od", "<CMD>lua require('functions').findFiles('~/dotfiles')<CR>", "Find in dotfiles")
set_vim_keymap(
	"n",
	"<leader>oz",
	"<CMD>lua require('functions').findFiles('~/dotfiles/dotfiles/config/zsh')<CR>",
	"Find in zsh files"
)
set_vim_keymap("n", "<leader>on", "<CMD>lua require('functions').findFiles('~/.config/nvim')<CR>", "Find in nvim files")
set_vim_keymap("n", "<leader>og", "<CMD>lua require('functions').findFiles('~/go/src')<CR>", "Find in go src files")
set_vim_keymap("n", "<leader>ob", "<CMD>lua require('functions').findFiles('~/Brainhole')<CR>", "Find in note files")

-- Scroll Keybinds --
set_vim_keymap({ "n", "v" }, "j", "<CMD>lua require('functions').scroll('gj')<CR>", "Down on wrapped lines visually")
set_vim_keymap({ "n", "v" }, "k", "<CMD>lua require('functions').scroll('gk')<CR>", "Up on wrapped lines visually")
set_vim_keymap("n", "n", "nzz", "Center cursor after search jump")
set_vim_keymap("n", "N", "Nzz", "Center cursor after search jump")

-- Indent Keybinds --
set_vim_keymap("v", ">", ">gv", "Indent while keeping selection")
set_vim_keymap("v", "<", "<gv", "Remove indent while keeping selection")

-- Split Keybinds --
set_vim_keymap("n", "<C-W>|", "<C-W>t<C-W>H", "Change to vertical splits")
set_vim_keymap("n", "<C-W>-", "<C-W>t<C-W>K", "Change to horizontal splits")
set_vim_keymap("n", "<A-\\>", "<C-W><C-V>", "Vertical split")
set_vim_keymap("n", "<A-->", "<C-W><C-S>", "Horizontal split")
set_vim_keymap("n", "<M-Up>", "<CMD>resize +2<CR>", "Resize horizontal split bigger")
set_vim_keymap("n", "<M-Down>", "<CMD>resize -2<CR>", "Resize horizontal split smaller")
set_vim_keymap("n", "<M-Left>", "<CMD>vertical resize -2<CR>", "Resize vertical split smaller")
set_vim_keymap("n", "<M-Right>", "<CMD>vertical resize +2<CR>", "Resize vertical split bigger")

-- Diff Keybinds --
set_vim_keymap(
	"n",
	"<leader>df",
	"<CMD>lua require('functions').diffOpenFileToggle()<CR>",
	"Diff an unopened file with the one currently open"
)
set_vim_keymap("n", "<leader>dv", "<CMD>lua require('functions').diffToggle()<CR>", "Toggle diff")

-- Search Keybinds --
set_vim_keymap("n", "<ESC>", "<CMD>lua require('functions').removeSearch()<CR>", "Remove search highlighting")
set_vim_keymap("n", "*", "<CMD>lua require('functions').searchWordUnderCursorForward()<CR>", "Improved forward search")
set_vim_keymap(
	"n",
	"#",
	"<CMD>lua require('functions').searchWordUnderCursorBackward()<CR>",
	"Improved backward search"
)

-- Bufferline --
set_vim_keymap("n", "<A-h>", "<CMD>BufferLineCyclePrev<CR>", "Bufferline view previous")
set_vim_keymap("n", "<A-l>", "<CMD>BufferLineCycleNext<CR>", "Bufferline view next")
set_vim_keymap("n", "<A-,>", "<CMD>BufferLineMovePrev<CR>", "Bufferline move to previous")
set_vim_keymap("n", "<A-.>", "<CMD>BufferLineMoveNext<CR>", "Bufferline move to next")

-- Dial --
local dialOK, dialMap = pcall(require, "dial.map")
if dialOK then
	set_vim_keymap("n", "<C-c>", dialMap.inc_normal(), "Dial increment")
	set_vim_keymap("n", "<C-x>", dialMap.dec_normal(), "Dial decrement")
end

-- Diffview --
set_vim_keymap("n", "<leader>gv", "<CMD>lua require('functions').gitDiffToggle()<CR>", "Git Diff Toggle")

-- Flash --
set_vim_keymap("n", "<Backspace>", "<CMD>lua require('flash').jump()<CR>", "Flash jump")
set_vim_keymap("n", "<leader><Backspace>", "<CMD>lua require('flash').treesitter()<CR>", "Flash treesitter")
set_vim_keymap("n", "<leader>y", "<CMD>lua require('flash').treesitter_search()<CR>", "Flash treesitter search")

-- Fugitive --
set_vim_keymap("n", "<leader>gb", "<CMD>Git blame<CR>", "Git blame buffer")

-- GitLinker --
set_vim_keymap({ "n", "v" }, "<leader>gl", "<CMD>GitLink<CR>", "Copy git link to clipboard")
set_vim_keymap({ "n", "v" }, "<leader>gL", "<CMD>GitLink!<CR>", "Open git link in browser")

-- GitMessenger --
set_vim_keymap("n", "<leader>gd", "<CMD>GitMessenger<CR>", "Open additional git details about current line")

-- Gitsigns --
set_vim_keymap("n", "<leader>hs", "<CMD>Gitsigns stage_hunk<CR>", "Stage git hunk")
set_vim_keymap("n", "<leader>hu", "<CMD>Gitsigns undo_stage_hunk<CR>", "Unstage git hunk")
set_vim_keymap("n", "<leader>hr", "<CMD>Gitsigns reset_hunk<CR>", "Reset git hunk")
set_vim_keymap("n", "<leader>hS", "<CMD>Gitsigns stage_buffer<CR>", "Git stage buffer")
set_vim_keymap("n", "<leader>hR", "<CMD>Gitsigns reset_buffer<CR>", "Git reset buffer")
set_vim_keymap("n", "<leader>hP", "<CMD>Gitsigns preview_hunk<CR>", "Preview git hunk")
set_vim_keymap("n", "<leader>hp", "<CMD>Gitsigns prev_hunk<CR>", "Previous git hunk")
set_vim_keymap("n", "<leader>hn", "<CMD>Gitsigns next_hunk<CR>", "Next git hunk")

-- GX --
set_vim_keymap("n", "gx", "<CMD>Browse<CR>", "Open link")
-- Mini.map --
set_vim_keymap("n", "<Delete>", "<CMD>lua MiniMap.toggle()<CR>", "Toggle minimap")
set_vim_keymap("n", "<Delete><Delete>", "<CMD>lua MiniMap.toggle_focus()<CR>", "Toggle focus into minimap")

-- Navigator --
set_vim_keymap("n", "<C-h>", "<CMD>NavigatorLeft<CR>", "Navigate Left")
set_vim_keymap("n", "<C-l>", "<CMD>NavigatorRight<CR>", "Navigate Right")
set_vim_keymap("n", "<C-k>", "<CMD>NavigatorUp<CR>", "Navigate Up")
set_vim_keymap("n", "<C-j>", "<CMD>NavigatorDown<CR>", "Navigate Down")

-- Neo Tree --
set_vim_keymap("n", ";", "<CMD>Neotree filesystem toggle right<CR>", "Toggle neotree")
set_vim_keymap("n", "'", "<CMD>Neotree buffers toggle right<CR>", "Toggle neotree buffer view")
set_vim_keymap("n", "\\", "<CMD>Neotree reveal right<CR>", "Show current buffer in neotree")

-- Possession --
local pOK, possession = pcall(require, "nvim-possession")
if pOK then
	set_vim_keymap("n", "<leader>sl", function()
		possession.list()
	end, "Show session list")
	set_vim_keymap("n", "<leader>sn", function()
		possession.new()
	end, "Create new session")
	set_vim_keymap("n", "<leader>su", function()
		possession.update()
	end, "Update session")
end

-- Sad --
set_vim_keymap("n", "<leader>sr", "<CMD>Sad<CR>", "Search/replace within cwd")

-- Telescope --
set_vim_keymap("n", "<leader>r", "<CMD>Telescope oldfiles<CR>", "Search recently opened files")
set_vim_keymap("n", "<leader>s", "<CMD>Telescope live_grep hidden=true<CR>", "Search inside files in cwd")
set_vim_keymap("n", "<leader>ff", "<CMD>Telescope find_files hidden=true<CR>", "Search for files by name in cwd")
set_vim_keymap("n", "<leader>h", "<CMD>Telescope help_tags<CR>", "Search help files")
set_vim_keymap("n", "<leader>ss", "<CMD>Telescope grep_string<CR>", "Search for word under cursor in cwd")
set_vim_keymap("n", "<leader>k", "<CMD>Telescope keymaps<CR>", "Search keymaps")
set_vim_keymap("n", "<leader>ls", "<CMD>Telescope luasnip<CR>", "Search luasnip")
set_vim_keymap("n", "<leader>e", "<CMD>Telescope env<CR>", "Search env vars")
set_vim_keymap("n", "<leader>p", "<CMD>Telescope lazy<CR>", "Search in plugins/lazy")
set_vim_keymap("n", "<leader>u", "<CMD>Telescope undo<CR>", "Search in undo history")
set_vim_keymap(
	"n",
	"<leader>g",
	"<CMD>Telescope advanced_git_search show_custom_functions<CR>",
	"Advanced git functions"
)

-- Vim Bbye --
set_vim_keymap("n", "<leader>q", "<CMD>Bdelete<CR>", "Close buffer")
set_vim_keymap("n", "<leader>wq", "<CMD>w<CR><CMD>Bdelete<CR>", "Write and close buffer")
set_vim_keymap("n", "<leader>1", "<CMD>Bdelete!<CR>", "Close buffer without saving")
