local cmd = vim.cmd -- Commands
local o = vim.o -- Global
local bo = vim.bo -- Buffer
local wo = vim.wo -- Window
local api = vim.api -- Api
Colors = require("colors")

-- Globals --
o.ignorecase = true -- Case insensitive searching
o.smartcase = true -- Override ignorecase if search pattern is mixed case
o.autowriteall = true
o.title = true
o.updatetime = 100 -- Time it takes to write to swap / update git gutter
o.clipboard = "unnamedplus" -- Use system clipboard
o.completeopt = "menu,menuone,noselect" -- For LSP/Complete
o.incsearch = true -- Show search results while still typing
o.laststatus = 3 -- Only show one status bar
o.timeoutlen = 400 -- Length of time to wait until accepting the keypress sequence
o.fillchars = "vert:▏,vertleft:▏,vertright:▏,verthoriz:+,horiz:-,horizup:-,horizdown:-"
o.commentstring = "# %s"
o.virtualedit = "block"
vim.g["center_after_scroll"] = true
-- o.cmdheight = 0 -- Uneeded due to Noice plugin

-- Buffer --
bo.tabstop = 4 -- Number of cols occupied by tab
bo.expandtab = true -- Converts tabs to whitespace
bo.autoindent = true -- Indent new line the same as previous
bo.shiftwidth = 4 -- Width for autoindents
bo.matchpairs = "<:>,(:),{:},[:]" -- Hightlight matching brackets
bo.undofile = true -- Save undo history in file

-- Window --
wo.cursorline = true -- Highlight current cursor line
-- wo.relativenumber = true -- Set relative line numbers
wo.number = true -- Set absolute line number
wo.conceallevel = 2 -- Conceal markdown
wo.spell = false -- Done with spelunker
wo.signcolumn = "yes:2"

-- Diagnostic --
vim.diagnostic.config({ float = { border = "rounded" } })

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
	set_tf_to_tf_and_hcl = {
		event = { "BufEnter" },
		pattern = "*.tf",
		callback = function()
			cmd("set filetype=hcl.tf")
		end,
	},
	set_tfvars_to_tf_and_hcl = {
		event = { "BufEnter" },
		pattern = "*.tfvars",
		callback = function()
			cmd("set filetype=hcl.tf")
		end,
	},
	kitty_conf_highlighting = {
		event = { "BufEnter" },
		pattern = "kitty.conf",
		callback = function()
			api.nvim_command("set ft=kitty")
		end,
	},
	kitty_session_highlighting = {
		event = { "BufEnter" },
		pattern = "*.session",
		callback = function()
			api.nvim_command("set ft=kitty")
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
}
augroups.buf_write_post = {
	reload_sway_on_config_change = {
		event = { "BufWritePost" },
		pattern = "*/sway/config.d/*",
		callback = function()
			cmd([[ silent !swaymsg reload ]])
		end,
	},
	reload_kitty_on_config_change = {
		event = { "BufWritePost" },
		pattern = "kitty.conf",
		callback = function()
			cmd([[ silent !kill -SIGUSR1 $(pgrep kitty) ]])
		end,
	},
}

augroups.misc = {
	highlight_yanked_text = {
		event = { "TextYankPost" },
		pattern = "*",
		callback = function()
			vim.highlight.on_yank({ higroup = "YankHighlight" })
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
	rainbow = { -- Make first rainbow bracket not gray
		event = { "FileType" },
		pattern = "*",
		callback = function()
			api.nvim_set_hl(0, "rainbowcol1", { fg = Colors.red })
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
