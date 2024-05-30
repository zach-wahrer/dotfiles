local M = {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	event = "VeryLazy",
}

function M.config()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"bash",
			"c",
			"dockerfile",
			"diff",
			"git_config",
			"git_rebase",
			-- "gitcommit", -- Currently erroring when opening up a commit message
			"gitignore",
			"go",
			"gosum",
			"gowork",
			"gomod",
			"hcl",
			"html",
			"hurl",
			"javascript",
			"jq",
			"json",
			"lua",
			"make",
			"markdown",
			"markdown_inline",
			"python",
			"regex",
			"toml",
			"terraform",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
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
		indent = { enable = false },
		rainbow = {
			enable = true,
			-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
			extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
			max_file_lines = nil, -- Do not enable for files with more than n lines, int
			-- colors = {}, -- table of hex strings
			-- termcolors = {} -- table of colour name strings
		},
		autotag = {
			enable = true,
		},
		-- incremental_selection = {
		-- 	enable = true,
		-- 	keymaps = {
		-- 		init_selection = "<leader>i", -- set to `false` to disable one of the mappings
		-- 		node_incremental = "<leader>i",
		-- 		-- scope_incremental = "<C-s>",
		-- 		node_decremental = "<C-r>",
		-- 	},
		-- },
	})
end

return M
