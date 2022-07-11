local cmd = vim.cmd -- Commands
local o = vim.o -- Global
local bo = vim.bo -- Buffer
local wo = vim.wo -- Window
local api = vim.api -- Api

-- Color --
require("onedark").setup({
	style = "darker",
})
require("onedark").load()
-- require("onedarkpro").setup({
-- 	theme = "onedark",
-- })
-- require("onedarkpro").load()

o.termguicolors = true

api.nvim_set_hl(0, "Search", { bg = "#aa03af", fg = "Orange", underline = 1 })
api.nvim_set_hl(0, "SpelunkerSpellBad", { undercurl = 1 })
api.nvim_set_hl(0, "SpelunkerComplexOrCompoundWord", { underdot = 1 })

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
local augroups = {}
augroups.buf_enter = {
	full_path_in_title = {
		event = { "BufEnter" },
		pattern = "*",
		callback = function()
			cmd([[ let &titlestring = expand('%:p') ]])
		end,
	},
	no_auto_comment_new_lines = {
		event = { "BufEnter" },
		pattern = "*",
		callback = function()
			cmd([[ set fo-=c fo-=r fo-=o ]])
		end,
	},
}
augroups.buf_write_pre = {
	remove_whitespace_on_save = {
		event = { "BufWritePre" },
		callback = function()
			cmd([[ :%s/\s\+$//e ]])
		end,
	},
	format_ts_files = {
		event = { "BufWritePre" },
		pattern = "*.ts",
		callback = function()
			cmd([[ EslintFixAll ]])
		end,
	},
	format_js_files = {
		event = { "BufWritePre" },
		pattern = "*.js",
		callback = function()
			cmd([[ EslintFixAll ]])
		end,
	},
	format_vue_files = {
		event = { "BufWritePre" },
		pattern = "*.vue",
		callback = function()
			cmd([[ EslintFixAll ]])
		end,
	},
	format_lua_files = {
		event = { "BufWritePre" },
		pattern = "*.lua",
		callback = function()
			require("stylua-nvim").format_file()
		end,
	},
}
augroups.buf_write_post = {
	reload_i3_on_config_change = {
		event = { "BufWritePost" },
		pattern = "*/i3/config",
		callback = function()
			cmd([[ silent !i3-msg reload ]])
		end,
	},
	reload_kitty_on_config_change = {
		event = { "BufWritePost" },
		pattern = "kitty.conf",
		callback = function()
			cmd([[ silent !kill -SIGUSR1 $(pgrep kitty) ]])
		end,
	},
	format_terraform = {
		event = { "BufWritePost" },
		pattern = "*.tf",
		callback = function()
			cmd([[ silent !terraform fmt %:p:h ]])
		end,
	},
	format_tfvars = {
		event = { "BufWritePost" },
		pattern = "*.tfvars",
		callback = function()
			cmd([[ silent !terraform fmt %:p:h ]])
		end,
	},
}
augroups.misc = {
	highlight_yanked_text = {
		event = { "TextYankPost" },
		pattern = "*",
		callback = function()
			vim.highlight.on_yank()
		end,
	},
}
-- augroups.win_enter = {
-- 	set_rel_line_numbers_on_focus = {
-- 		event = { "WinEnter,FocusGained" },
-- 		pattern = "*",
-- 		callback = function()
-- 			cmd([[ :setlocal number relativenumber ]])
-- 		end,
-- 	},
-- }
-- augroups.win_leave = {
-- 	remove_rel_line_numbers_on_unfocus = {
-- 		event = { "WinLeave,FocusLost" },
-- 		pattern = "*",
-- 		callback = function()
-- 			cmd([[ :setlocal number norelativenumber ]])
-- 		end,
-- 	},
-- }
augroups.file_type = {
	ts = {
		event = { "FileType" },
		pattern = "ts",
		callback = function()
			cmd([[ set ts=4 sw=4 sts=0 autoindent ]])
		end,
	},
	js = {
		event = { "FileType" },
		pattern = "js",
		callback = function()
			cmd([[ set ts=4 sw=4 sts=0 autoindent ]])
		end,
	},
	vue = {
		event = { "FileType" },
		pattern = "vue",
		callback = function()
			cmd([[ set ts=4 sw=4 sts=0 autoindent ]])
		end,
	},
}

for group, commands in pairs(augroups) do
	local augroup = vim.api.nvim_create_augroup("AU_" .. group, { clear = true })

	for _, opts in pairs(commands) do
		local event = opts.event
		opts.event = nil
		opts.group = augroup
		vim.api.nvim_create_autocmd(event, opts)
	end
end
