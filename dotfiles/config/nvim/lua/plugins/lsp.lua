local M = {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"ray-x/lsp_signature.nvim",
			config = function()
				require("lsp_signature").setup()
			end,
		}, -- Show func signature
		{
			"SmiteshP/nvim-navbuddy",
			dependencies = { "SmiteshP/nvim-navic", "MunifTanjim/nui.nvim" },
		},
	},
	event = "VeryLazy",
}

function M.config()
	local navbuddy = require("nvim-navbuddy")

	-- Mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	local opts = { noremap = true, silent = true }

	-- Use an on_attach function to only map the following keys
	-- after the language server attaches to the current buffer

	local on_attach = function(client, bufnr)
		navbuddy.attach(client, bufnr)
		-- Enable completion triggered by <c-x><c-o>
		vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

		-- Mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "ds", "<cmd>Telescope diagnostics<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-s>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
			opts)
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"<leader>wr",
			"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
			opts
		)
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"<leader>wl",
			"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
			opts
		)
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>CodeActionMenu<CR>", opts)
		-- vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>Telescope lsp_references <CR>", opts)
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.lsp.buf.format {async = true}<CR>",
			opts)

		-- Workaround for gopls semantic token highlighting https://github.com/golang/go/issues/54531#issuecomment-1464982242
		if not client.server_capabilities.semanticTokensProvider then
			local semantic = client.config.capabilities.textDocument.semanticTokens
			client.server_capabilities.semanticTokensProvider = {
				full = true,
				legend = {
					tokenTypes = semantic.tokenTypes,
					tokenModifiers = semantic.tokenModifiers,
				},
				range = true,
			}
		end
	end

	local lspconfig = require("lspconfig")
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

	-- Use a loop to conveniently call 'setup' on multiple servers and
	-- map buffer local keybindings when the language server attaches
	local servers = {
		"bashls",
		"clangd",
		"dockerls",
		"eslint",
		"marksman",
		"pyright",
		"rust_analyzer", -- Configured with rustaceanvim
		"terraformls",
		"tsserver",
		"yamlls",
	}
	for _, lsp in pairs(servers) do
		lspconfig[lsp].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = false,
		-- virtual_text = false,
		-- update_in_insert = false,
		-- -- Enable underline, use default values
		-- underline = true,
		-- -- Enable virtual text only on Warning or above, override spacing to 2
		virtual_text = {
			spacing = 2,
			min = vim.diagnostic.severity.WARN,
		},
	})

	lspconfig.lua_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				hint = {
					enable = true,
				},
				diagnostics = {
					globals = { "vim" },
				},
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	})
	lspconfig.gopls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			gopls = {
				buildFlags = { "-tags", "integration" },
				-- semanticTokens = true,
				-- analyses = {
				-- 	unreachable = true,
				-- 	nilness = true,
				-- 	unusedparams = true,
				-- 	useany = true,
				-- 	unusedwrite = true,
				-- 	ST1003 = true,
				-- 	undeclaredname = true,
				-- 	fillreturns = true,
				-- 	nonewvars = true,
				-- 	fieldalignment = false,
				-- 	shadow = true,
				-- },
				-- codelenses = {
				-- 	generate = true, -- show the `go generate` lens.
				-- 	gc_details = true, -- Show a code lens toggling the display of gc's choices.
				-- 	test = true,
				-- 	tidy = true,
				-- 	vendor = true,
				-- 	regenerate_cgo = true,
				-- 	upgrade_dependency = true,
				-- },
				usePlaceholders = true,
				-- staticcheck = true,
				-- ["ui.inlayhint.hints"] = {
				-- 	assignVariableTypes = true,
				-- 	compositeLiteralFields = true,
				-- 	compositeLiteralTypes = true,
				-- 	constantValues = true,
				-- 	functionTypeParameters = true,
				-- 	parameterNames = true,
				-- 	rangeVariableTypes = true,
				-- },
				-- diagnosticsDelay = "500ms",
				-- gofumpt = true,
			},
		},
		init_options = {
			buildFlags = { "-tags", "integration" },
		},
	})
end

return M
