local opts = { noremap = true, silent = true }
local noremap = { noremap = true }
local set_keymap = vim.api.nvim_set_keymap
-- local set_vim_keymap = vim.keymap.set
-- vim.keymap.set({"n","x"}, "p", "<CMD><CR>")

-- General Keybinds --
set_keymap("n", "<leader>n", "<CMD>enew<CR>", opts) -- New scratch buffer
set_keymap("n", "<leader>w", "<CMD>w<CR>", opts) -- Write
set_keymap("n", "<leader>a", "ggVG<CR>", opts) -- Select all
set_keymap("n", "<leader>sc", "<CMD>lua require('functions').toScratch()<CR>", opts) -- Send output of command to scratch buffer
set_keymap("n", "<leader>sa", "<CMD>lua require('functions').sourceAllConfigFiles()<CR>", opts) -- Source all config files
set_keymap("n", "<leader>ol", "<CMD>lua require('functions').openLink()<CR>", opts)

set_keymap("n", "<leader>c", "<CMD>lclose<CR><CMD>cclose<CR>", opts) -- Close quickfix and location list
set_keymap("n", "<leader>cn", "<CMD>cn<CR>", opts) -- Goto next quickfix item
set_keymap("n", "<leader>cp", "<CMD>cp<CR>", opts) -- Goto previous quickfix item
set_keymap("n", "<leader>co", "<CMD>lua require('functions').openAllQuickFix()<CR>", opts) -- Open all quick fix list into buffers

set_keymap("n", "<leader>ei", "<CMD>e ~/dotfiles/dotfiles/config/i3/config<CR>", opts)
set_keymap("n", "<leader>ek", "<CMD>e ~/dotfiles/dotfiles/config/kitty/kitty.conf<CR>", opts)
set_keymap("n", "<leader>ez", "<CMD>e ~/dotfiles/dotfiles/config/zsh/.zshrc<CR>", opts)
set_keymap("n", "<leader>en", "<CMD>e ~/.config/nvim/lua/config.lua<CR>", opts)

set_keymap("n", "j", "gj", opts) -- Down on wrapped lines visually
set_keymap("n", "k", "gk", opts) -- Up on wrapped lines visually
set_keymap("v", "j", "gj", opts) -- Down on wrapped lines visually while selecting
set_keymap("v", "k", "gk", opts) -- Up on wrapped lines visually while selecting
set_keymap("v", ">", ">gv", opts) -- Indent while keeping selection
set_keymap("v", "<", "<gv", opts) -- Remove indent while keeping selection

set_keymap("v", "<A-j>", "<CMD>m '>+1<CR>gv=gv", opts) -- Move selected text down
set_keymap("v", "<A-k>", "<CMD>m '<-2<CR>gv=gv", opts) -- Move selected text up
set_keymap("n", "<A-Enter>", "O<ESC>", opts) -- Add line above
set_keymap("n", "<CR>", "o<ESC>", opts) -- Add line below
set_keymap("n", "<ESC>", "<CMD>lua require('functions').removeSearch()<CR>", opts) -- Remove search highlighting

set_keymap("n", "<C-W>|", "<C-W>t<C-W>H", opts) -- Change to vertical splits
set_keymap("n", "<C-W>-", "<C-W>t<C-W>K", opts) -- Change to horizontal splits
set_keymap("n", "<C-\\>", "<C-W><C-V>", opts) -- Vertical split
set_keymap("n", "<C-->", "<C-W><C-S>", opts) -- Horizontal split
set_keymap("n", "<M-Up>", "<CMD>resize +2<CR>", opts) -- Resize horizontal split
set_keymap("n", "<M-Down>", "<CMD>resize -2<CR>", opts) -- Resize horizontal split
set_keymap("n", "<M-Left>", "<CMD>vertical resize -2<CR>", opts) -- Resize vertical split
set_keymap("n", "<M-Right>", "<CMD>vertical resize +2<CR>", opts) -- Resize vertical split

set_keymap("n", "<leader>df", "<CMD>lua require('functions').diffOpenFileToggle()<CR>", noremap) -- Diff an unopened file with the one currently open.
set_keymap("n", "<leader>dv", "<CMD>lua require('functions').diffToggle()<CR>", noremap) -- Toggle diff
set_keymap("n", "<leader>id", "<CMD>put=strftime('%Y-%m-%d')<CR>", opts) -- Insert current date
set_keymap("v", "<leader>64", "c<c-r>=system('base64 --decode', @\")<CR><ESC>", opts) -- Base64 decode string

set_keymap("n", "*", "<CMD>lua require('functions').searchWordUnderCursorForward()<CR>", opts) -- Improved forward search
set_keymap("n", "#", "<CMD>lua require('functions').searchWordUnderCursorBackward()<CR>", opts) -- Improved backward search

-- Dap --
set_keymap("n", "<leader>dt", "<CMD>lua require('dapui').toggle()<CR>", opts)
set_keymap("n", "<leader>dc", "<CMD>lua require('dap').continue()<CR>", opts)
set_keymap("n", "<leader>dse", "<CMD>lua require('functions').debugSetEnvironment()<CR>", opts)

set_keymap("n", "<leader>ds", "<CMD>lua require('dap').step_over()<CR>", opts)
set_keymap("n", "<leader>di", "<CMD>lua require('dap').step_into()<CR>", opts)
set_keymap("n", "<leader>do", "<CMD>lua require('dap').step_out()<CR>", opts)
set_keymap("n", "<leader>db", "<CMD>lua require('dap').toggle_breakpoint()<CR>", opts)
set_keymap("n", "<leader>dra", "<CMD>lua require('dap').clear_breakpoints()<CR>", opts)
set_keymap("n", "<leader>dj", "<CMD>lua require('jester').debug({dap = { console = ''}})<CR>", opts)

-- MiniBufremove --
set_keymap("n", "<leader>q", "<CMD>Bdelete<CR>", opts)
set_keymap("n", "<leader>wq", "<CMD>w<CR><CMD>Bdelete<CR>", opts)
set_keymap("n", "<leader>1", "<CMD>Bdelete!<CR>", opts)

-- Bufferline --
set_keymap("n", "<A-h>", "<CMD>BufferLineCyclePrev<CR>", opts)
set_keymap("n", "<A-l>", "<CMD>BufferLineCycleNext<CR>", opts)
set_keymap("n", "<A-,>", "<CMD>BufferLineMovePrev<CR>", opts)
set_keymap("n", "<A-.>", "<CMD>BufferLineMoveNext<CR>", opts)

-- Dial --
set_keymap("n", "<C-c>", require("dial.map").inc_normal(), opts)
set_keymap("n", "<C-x>", require("dial.map").dec_normal(), opts)

-- Diffview --
set_keymap("n", "<leader>gv", "<CMD>DiffviewFileHistory<CR>", opts)
-- set_keymap("n", "<leader>dvo", "<CMD>DiffviewOpen<CR>", opts)
set_keymap("n", "<leader>gvc", "<CMD>DiffviewClose<CR>", opts)

-- Fugitive --
set_keymap("n", "<leader>gb", "<CMD>Git blame<CR>", opts)

-- Gitsigns --
set_keymap("n", "<leader>hs", "<CMD>Gitsigns stage_hunk<CR>", opts)
set_keymap("n", "<leader>hu", "<CMD>Gitsigns undo_stage_hunk<CR>", opts)
set_keymap("n", "<leader>hr", "<CMD>Gitsigns reset_hunk<CR>", opts)
set_keymap("n", "<leader>hS", "<CMD>Gitsigns stage_buffer<CR>", opts)
set_keymap("n", "<leader>hR", "<CMD>Gitsigns reset_buffer<CR>", opts)
set_keymap("n", "<leader>hp", "<CMD>Gitsigns preview_hunk<CR>", opts)

-- Lazygit --
set_keymap("n", "<leader>lg", "<CMD>LazyGit<CR>", opts)

-- LSP -- Per client mappings are in lsp config file
set_keymap("n", "<leader>lsp", "<CMD>LspStop<CR><CMD>call wait(1500, 1==0)<CR><CMD>LspStart<CR>", opts)
set_keymap("n", "<leader>d", "<CMD>lua vim.diagnostic.open_float()<CR>", opts)
set_keymap("n", "<leader>dw", "<CMD>DiagWindowShow<CR>", opts)
set_keymap("n", "<leader>dn", "<CMD>lua vim.diagnostic.goto_next()<CR>", opts)
set_keymap("n", "<leader>dp", "<CMD>lua vim.diagnostic.goto_prev()<CR>", opts)
set_keymap("n", "<leader>ll", "<CMD>lua vim.diagnostic.setloclist()<CR>", opts)

-- Mini.map --
set_keymap("n", "<Backspace>", "<CMD>lua MiniMap.toggle()<CR>", opts)

-- Neogen --
set_keymap("n", "<leader>ifa", "<CMD>lua require('neogen').generate({type = 'func'})<CR>", opts)
set_keymap("n", "<leader>ita", "<CMD>lua require('neogen').generate({type = 'type'})<CR>", opts)

-- Nvim Tree --
set_keymap("n", "\\", "<CMD>NvimTreeToggle<CR>", opts)

-- Spectre --
set_keymap("n", "<leader>S", "<CMD>lua require('spectre').open()<CR>", opts)
set_keymap("n", "<leader>Sw", "<CMD>lua require('spectre').open_visual({select_word=true})<CR>", opts)
set_keymap("v", "<leader>Sw", "<ESC>:lua require('spectre').open_visual()<CR>", opts)

-- Telescope --
set_keymap("n", "<leader>r", "<CMD>Telescope oldfiles<CR>", opts)
set_keymap("n", "<leader>s", "<CMD>Telescope live_grep<CR>", opts)
set_keymap("n", "<leader>ff", "<CMD>Telescope find_files<CR>", opts)
set_keymap("n", "<leader>h", "<CMD>Telescope help_tags<CR>", opts)
set_keymap("n", "<leader>ss", "<CMD>Telescope grep_string<CR>", opts)
set_keymap("n", "<leader>k", "<CMD>Telescope keymaps<CR>", opts)
set_keymap("n", "<leader>ls", "<CMD>Telescope luasnip<CR>", opts)
set_keymap("n", "<leader>p", "<CMD>Telescope packer<CR>", opts)
set_keymap("n", "<leader>e", "<CMD>Telescope env<CR>", opts)
set_keymap("n", "<leader>sf", "<CMD>GrepInDirectory<CR>", opts)
set_keymap("n", "<leader>fd", "<CMD>FileInDirectory<CR>", opts)
set_keymap("n", "<leader>z", "<CMD>Telescope zoxide list<CR>", opts)

-- Vim Go --
set_keymap("n", "<leader>ggt", "<CMD>GoTests<CR>", opts)
set_keymap("n", "<leader>gat", "<CMD>GoAddTags<CR>", opts)
set_keymap("n", "<leader>gie", "<CMD>GoIfErr<CR>", opts)
set_keymap("n", "<leader>gc", "<CMD>GoCoverageToggle<CR>", opts)
set_keymap("n", "<leader>gf", "<CMD>GoFillStruct<CR>", opts)
set_keymap("n", "<leader>gt", "<CMD>GoTest<CR>", opts)
set_keymap("n", "<leader>ga", "<CMD>GoAlternate<CR>", opts)

-- Vim Test --
set_keymap("n", "<leader>tf", "<CMD>TestFile<CR>", opts)
set_keymap("n", "<leader>t", "<CMD>TestNearest<CR>", opts)
set_keymap("n", "<leader>tt", "<CMD>TestLast<CR>", opts)

-- Markdown --
set_keymap("n", "<leader>pm", "<CMD>MarkdownPreview<CR>", opts)
