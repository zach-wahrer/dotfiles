local cmd = vim.cmd -- Commands
local o = vim.o -- Global
local bo = vim.bo -- Buffer
local wo = vim.wo -- Window
local api = vim.api -- Api

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
	set_tf_to_hcl = {
		event = { "BufEnter" },
		pattern = "*.tf",
		callback = function()
			cmd("set filetype=hcl")
		end,
	},
	set_tfvars_to_hcl = {
		event = { "BufEnter" },
		pattern = "*.tfvars",
		callback = function()
			cmd("set filetype=hcl")
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

-- augroups.cursor_hold = {
-- highlight_doc_on_cursor_hold = {
-- 	event = { "CursorHold" },
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.lsp.for_each_buffer_client(0, function(client)
-- 			if client.server_capabilities.document_highlight then
-- 				vim.lsp.buf.document_highlight()
-- 			end
-- 		end)
-- 	end,
-- },
-- remove_highlight_on_cursor_moved = {
-- 	event = { "CursorMoved" },
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.lsp.buf.clear_references()
-- 	end,
-- },
-- show_diags_on_cursor_hold = {
-- 	event = { "CursorHold" },
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.diagnostic.open_float()
-- 	end,
-- },
-- }

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
	-- format_yml = {
	-- 	event = { "BufWritePost" },
	-- 	pattern = "*.yml",
	-- 	callback = function()
	-- 		os.execute("~/.config/nvim/lua/scripts/kitty_opener.sh")
	-- 		cmd([[silent !kitty @ --to "$KITTY_LISTEN_ON" send-text --match title:"nvim-output" "yamllint %:p\x0d" ]])
	-- 	end,
	-- },
	-- format_yaml = {
	-- 	event = { "BufWritePost" },
	-- 	pattern = "*.yaml",
	-- 	callback = function()
	-- 		os.execute("~/.config/nvim/lua/scripts/kitty_opener.sh")
	-- 		cmd([[silent !kitty @ --to "$KITTY_LISTEN_ON" send-text --match title:"nvim-output" "yamllint %:p\x0d" ]])
	-- 	end,
	-- },
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
