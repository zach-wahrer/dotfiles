local cmd = vim.cmd -- Commands
local o = vim.o -- Global
local bo = vim.bo -- Buffer
local wo = vim.wo -- Window

-- Color --
-- require("onedark").setup({
-- 	style = "darker",
-- })
-- require("onedark").load()
require("onedarkpro").setup({
	theme = "onedark",
})
require("onedarkpro").load()

o.termguicolors = true
cmd("hi Search guibg=#aa03af")
cmd("hi SpellBad guibg=gray20 guifg=Orange")

-- Globals --
o.ignorecase = true -- Case insensitive searching
o.mouse = "a" -- Enable mouse in all modes
o.autowrite = true
o.title = true
o.updatetime = 100 -- Time it takes to write to swap / update git gutter
o.wildmode = "longest,list" -- Bash like tab completions
o.clipboard = "unnamedplus" -- Use system clipboard
o.completeopt = "menu,menuone,noselect" -- For LSP/Complete
o.incsearch = true -- Show search results while still typing
o.laststatus = 3 -- Only show one status bar

-- Buffer --
bo.tabstop = 4 -- Number of cols occupied by tab
bo.expandtab = true -- Converts tabs to whitespace
bo.autoindent = true -- Indent new line the same as previous
bo.shiftwidth = 4 -- Width for autoindents
bo.matchpairs = "<:>,(:),{:},[:]" -- Hightlight matching brackets
bo.undofile = true -- Save undo history in file
bo.syntax = "on"

-- Window --
wo.cursorline = true -- Highlight current cursor line
wo.relativenumber = true -- Set relative line numbers
wo.number = true -- Set absolute line number
wo.conceallevel = 2 -- Conceal markdown
wo.spell = false -- Done with spelunker
wo.signcolumn = "yes:2"

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
-- autocmd("WinEnter,FocusGained", { -- Set relative line numbers on focus
-- 	pattern = "*",
-- 	group = reset_group,
-- 	callback = function()
-- 		vim.cmd([[ :setlocal number relativenumber ]])
-- 	end,
-- })
-- autocmd("WinLeave,FocusLost", { -- Remove relative line numbers when unfocused
-- 	pattern = "*",
-- 	group = reset_group,
-- 	callback = function()
-- 		vim.cmd([[ :setlocal number norelativenumber ]])
-- 	end,
-- })
autocmd("BufWritePre", { -- Remove whitespace on save
	pattern = "*",
	group = reset_group,
	callback = function()
		vim.cmd([[ :%s/\s\+$//e ]])
	end,
})
autocmd("BufEnter", { -- Don't auto comment new lines
	pattern = "*",
	group = reset_group,
	callback = function()
		vim.cmd([[ set fo-=c fo-=r fo-=o ]])
	end,
})
autocmd("bufwritepost", { -- Reload i3 on config change
	pattern = "*/i3/config",
	group = reset_group,
	callback = function()
		vim.cmd([[ silent !i3-msg reload ]])
	end,
})
autocmd("bufwritepost", { -- Reload kitty on config file change
	pattern = "kitty.conf",
	group = reset_group,
	callback = function()
		vim.cmd([[ silent !kill -SIGUSR1 $(pgrep kitty) ]])
	end,
})
-- JS --
autocmd("FileType", {
	pattern = "ts",
	group = reset_group,
	callback = function()
		vim.cmd([[ set ts=4 sw=4 sts=0 autoindent ]])
	end,
})
autocmd("FileType", {
	pattern = "js",
	group = reset_group,
	callback = function()
		vim.cmd([[ set ts=4 sw=4 sts=0 autoindent ]])
	end,
})
autocmd("FileType", {
	pattern = "vue",
	group = reset_group,
	callback = function()
		vim.cmd([[ set ts=4 sw=4 sts=0 autoindent ]])
	end,
})
autocmd("BufWritePre", {
	pattern = "*.ts",
	group = reset_group,
	callback = function()
		vim.cmd([[ EslintFixAll ]])
	end,
})
autocmd("BufWritePre", {
	pattern = "*.js",
	group = reset_group,
	callback = function()
		vim.cmd([[ EslintFixAll ]])
	end,
})
autocmd("BufWritePre", {
	pattern = "*.vue",
	group = reset_group,
	callback = function()
		vim.cmd([[ EslintFixAll ]])
	end,
})
-- Lua --
autocmd("BufWritePre", {
	pattern = "*.lua",
	group = reset_group,
	callback = function()
		require("stylua-nvim").format_file()
	end,
})
-- Terraform --
autocmd("BufWritePre", {
	pattern = "*.tf",
	group = reset_group,
	callback = function()
		vim.lsp.buf.formatting_sync()
	end,
})
autocmd("BufWritePre", {
	pattern = "*.tfvars",
	group = reset_group,
	callback = function()
		vim.lsp.buf.formatting_sync()
	end,
})
