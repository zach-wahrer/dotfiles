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
		"markdown_inline",
		"regex",
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
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
			-- You can choose the select mode (default is charwise 'v')
			-- selection_modes = {
			-- 	["@parameter.outer"] = "v", -- charwise
			-- 	["@function.outer"] = "V", -- linewise
			-- 	["@class.outer"] = "<c-v>", -- blockwise
			-- },
			-- If you set this to `true` (default is `false`) then any textobject is
			-- extended to include preceding xor succeeding whitespace. Succeeding
			-- whitespace has priority in order to act similarly to eg the built-in
			-- `ap`.
			include_surrounding_whitespace = true,
		},
		move = {
			enable = true,
			set_jumps = true, -- whether to set jumps in the jumplist
			goto_next_start = {
				["<leader>nf"] = "@function.outer",
				["<leader>nc"] = "@class.outer",
			},
			goto_previous_start = {
				["<leader>pf"] = "@function.outer",
				["<leader>pc"] = "@class.outer",
			},
		},
	},
})
