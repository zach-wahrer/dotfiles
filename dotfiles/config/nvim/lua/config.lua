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
api.nvim_set_hl(0, "LspDiagnosticsVirtualTextError", { fg = "Red" })
api.nvim_set_hl(0, "LspDiagnosticsVirtualTextWarning", { fg = "Yellow" })
api.nvim_set_hl(0, "LspDiagnosticsVirtualTextInformation", { fg = "White" })
api.nvim_set_hl(0, "LspDiagnosticsVirtualTextHint", { fg = "White" })
api.nvim_set_hl(0, "LspDiagnosticsUnderlineError", { underline = 1 })
api.nvim_set_hl(0, "LspDiagnosticsUnderlineWarning", { underline = 1 })
api.nvim_set_hl(0, "LspDiagnosticsUnderlineInformation", { underline = 1 })
api.nvim_set_hl(0, "LspDiagnosticsUnderlineHint", { underline = 1 })
api.nvim_set_hl(0, "WinSeparator", { fg = "#191919" })
api.nvim_set_hl(0, "NvimTreeVertSplit", { fg = "#191919" })

-- Globals --
o.ignorecase = true -- Case insensitive searching
o.smartcase = true -- Override ignorecase if search pattern is mixed case
o.mouse = "a" -- Enable mouse in all modes
o.autowrite = true
o.title = true
o.updatetime = 100 -- Time it takes to write to swap / update git gutter
o.wildmode = "longest,list" -- Bash like tab completions
o.clipboard = "unnamedplus" -- Use system clipboard
o.completeopt = "menu,menuone,noselect" -- For LSP/Complete
o.incsearch = true -- Show search results while still typing
o.laststatus = 3 -- Only show one status bar
o.timeoutlen = 500 -- Length of time to wait until accepting the keypress sequence

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
}
augroups.cursor_hold = {
	highlight_doc_on_cursor_hold = {
		event = { "CursorHold" },
		pattern = "*",
		callback = function()
			vim.lsp.for_each_buffer_client(0, function(client)
				if client.resolved_capabilities.document_highlight then
					vim.lsp.buf.document_highlight()
				end
			end)
		end,
	},
	remove_highlight_on_cursor_moved = {
		event = { "CursorMoved" },
		pattern = "*",
		callback = function()
			vim.lsp.buf.clear_references()
		end,
	},
	-- show_diags_on_cursor_hold = {
	-- 	event = { "CursorHold" },
	-- 	pattern = "*",
	-- 	callback = function()
	-- 		vim.diagnostic.open_float()
	-- 	end,
	-- },
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
	format_yml = {
		event = { "BufWritePost" },
		pattern = "*.yml",
		callback = function()
			os.execute("~/.config/nvim/lua/scripts/kitty_opener.sh")
			cmd([[silent !kitty @ --to "$KITTY_LISTEN_ON" send-text --match title:"nvim-output" "yamllint %:p\x0d" ]])
		end,
	},
	format_yaml = {
		event = { "BufWritePost" },
		pattern = "*.yaml",
		callback = function()
			os.execute("~/.config/nvim/lua/scripts/kitty_opener.sh")
			cmd([[silent !kitty @ --to "$KITTY_LISTEN_ON" send-text --match title:"nvim-output" "yamllint %:p\x0d" ]])
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
	rainbow = { -- Make first rainbow bracket not gray
		event = { "FileType" },
		pattern = "*",
		callback = function()
			api.nvim_set_hl(0, "rainbowcol1", { fg = "#ff7b72" })
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
