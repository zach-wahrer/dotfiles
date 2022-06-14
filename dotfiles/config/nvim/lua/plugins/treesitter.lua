--- TreeSitter & Rainbow Tags ---
require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"go",
		"gomod",
		"bash",
		"javascript",
		"json",
		"lua",
		"python",
		"typescript",
		"vue",
		"dockerfile",
		"html",
		"yaml",
		"hcl",
		"markdown",
	},
	sync_install = false,
	highlight = {
		enable = true,
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true, disable = { "python" } },
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})

-- local augroup = vim.api.nvim_create_augroup
-- local autocmd = vim.api.nvim_create_autocmd
-- local reset_group = augroup("reset_group_treesitter", { clear = true })

-- -- Needed due to bug in treesitter highlighting not showing on first file load after nvim starts. This just reloads the file.
-- autocmd("BufRead", {
-- 	pattern = "*",
-- 	group = reset_group,
-- 	callback = function()
-- 		vim.cmd([[:e]])
-- 	end,
-- })
