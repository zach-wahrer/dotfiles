vim.cmd([[
let mapleader="\<SPACE>" 	
filetype plugin indent on	" Auto-indenting depending on file type
]])

-- Search --
vim.o.ignorecase = true -- Case insensitive searching

-- Mouse --
vim.o.mouse = "a" -- Enable mouse in all modes

-- Default Formatting --
vim.bo.tabstop = 4 -- Number of cols occupied by tab
vim.bo.expandtab = true -- Converts tabs to whitespace
vim.bo.autoindent = true -- Indent new line the same as previous
vim.bo.shiftwidth = 4 -- Width for autoindents

-- Interface --
vim.o.autowrite = true
vim.wo.cursorline = true -- Highlight current cursor line
vim.o.updatetime = 100 -- Time it takes to write to swap / update git gutter
vim.bo.syntax = "on" -- Syntax highlighting
vim.o.title = true
vim.wo.relativenumber = true -- Set relative line numbers
vim.wo.number = true -- Set absolute line number
vim.wo.conceallevel = 2 -- Conceal markdown
vim.bo.matchpairs = "<:>,(:),{:},[:]" -- Hightlight matching brackets
vim.o.wildmode = "longest,list" -- Bash like tab completions
vim.o.clipboard = "unnamedplus" -- Use system clipboard
vim.o.completeopt = "menu,menuone,noselect" -- For LSP/Complete
vim.wo.spell = false -- Done with spelunker
-- vim.bo.spelllang = "en_us"
vim.o.incsearch = true -- Show search results while still typing
vim.bo.undofile = true -- Save undo history in file
vim.wo.signcolumn = "yes:2"
vim.o.laststatus = 3 -- Only show one status bar

-- General Keybinds --
vim.api.nvim_set_keymap("n", "<leader>w", ":w<CR>", { noremap = true }) -- Write
vim.api.nvim_set_keymap("n", "<leader>p", '"0p', { noremap = true }) -- Paste last yanked text
vim.api.nvim_set_keymap("n", "<A-Enter>", "O<Esc>", { noremap = true }) -- Add line above
vim.api.nvim_set_keymap("n", "<CR>", "o<Esc>", { noremap = true }) -- Add line below
vim.api.nvim_set_keymap("n", "<leader>a", "ggVG<CR>", { noremap = true }) -- Select all
vim.api.nvim_set_keymap("n", "<leader>id", ":put=strftime('%Y-%m-%d')<CR>", { noremap = true }) -- Select all
vim.api.nvim_set_keymap("n", "<C-W>|", "<C-W>t<C-W>H", { noremap = true }) -- Change to vertical splits
vim.api.nvim_set_keymap("n", "<C-W>-", "<C-W>t<C-W>K", { noremap = true }) -- Change to horizontal splits
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true }) -- Down on wrapped lines visually
vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true }) -- Up on wrapped lines visually
vim.api.nvim_set_keymap("n", "<ESC>", ":noh<CR>", { noremap = true, silent = true }) -- Remove search highlightingRemove search highlighting

-- Autocommands --
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local reset_group = augroup("reset_group_nvim", { clear = true })

autocmd("TextYankPost", { -- Highlight yanked text
	pattern = "*",
	group = reset_group,
	callback = function()
		vim.highlight.on_yank()
	end,
})
autocmd("Bufenter", { -- Full path in title
	pattern = "*",
	group = reset_group,
	callback = function()
		vim.cmd([[ let &titlestring = expand('%:p') ]])
	end,
})
autocmd("WinEnter,FocusGained", { -- Set relative line numbers on focus
	pattern = "*",
	group = reset_group,
	callback = function()
		vim.cmd([[ :setlocal number relativenumber ]])
	end,
})
autocmd("WinLeave,FocusLost", { -- Remove relative line numbers when unfocused
	pattern = "*",
	group = reset_group,
	callback = function()
		vim.cmd([[ :setlocal number norelativenumber ]])
	end,
})
