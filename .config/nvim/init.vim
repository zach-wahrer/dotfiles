set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

" Plugins
if filereadable(expand("~/.config/nvim/plugins.vim"))
    source ~/.config/nvim/plugins.vim
endif

let mapleader="\<SPACE>" 		" Map the leader key to SPACE
nnoremap <leader>w :w<CR>
nnoremap <X1Mouse> <C-O>
nnoremap <X2Mouse> <C-I>
nnoremap <leader>p "0p
filetype plugin indent on	" Auto-indenting depending on file type

" Colors
set termguicolors
let g:onedark_config = {
    \ 'style': 'warmer',
\}
" colorscheme one-nvim
colorscheme onedark
hi Search guibg=Cyan
hi SpellBad guibg=gray20 guifg=Orange

lua << EOF
-- Interface --
vim.o.autowrite = true
vim.wo.cursorline = true       -- Highlight current cursor line
vim.o.updatetime = 200         -- Time it takes to write to swap / update git gutter
vim.bo.syntax = "on"           -- Syntax highlighting
vim.o.title = true
vim.wo.relativenumber = true   -- Set relative line numbers
vim.wo.number = true           -- Set absolute line number
vim.api.nvim_exec([[ autocmd WinEnter,FocusGained * :setlocal number relativenumber ]], false) -- Set relative line numbers on focus
vim.api.nvim_exec([[ autocmd WinLeave,FocusLost   * :setlocal number norelativenumber ]], false) -- Remove relative line numbers when unfocused
vim.wo.conceallevel = 2        -- Conceal markdown
vim.bo.matchpairs = "<:>,(:),{:},[:]" -- Hightlight matching brackets
vim.o.wildmode = "longest,list" -- Bash like tab completions
vim.o.clipboard = "unnamedplus" -- Use system clipboard
vim.o.completeopt = "menu,menuone,noselect" -- For LSP/Complete
vim.wo.spell = true
vim.bo.spelllang = "en_us"

-- Search --
vim.o.ignorecase = true -- Case insensitive searching

-- Mouse --
vim.o.mouse = "a"  	-- Enable mouse in all modes

-- Default Formatting --
vim.bo.tabstop = 4  	 	-- Number of cols occupied by tab
vim.bo.expandtab = true   	-- Converts tabs to whitespace 
vim.bo.autoindent = true  	-- Indent new line the same as previous
vim.bo.shiftwidth = 4  	 	-- Width for autoindents

-- Language Configs --
require('go/go_config')
require('terraform/terraform_config')
require('js/js_config')

-- Plugin Configs --
require('dap_config')
require('betterbuffer_config')
require('lualine_config')
require('lua_config')
require('lsp_config')
require('prettier_config')
require('nvim-autopairs').setup{}
--Breaks tabout when loaded from external file, need to find fix
--require('nvm_cmp_config') 
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require("cmp")
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
			-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		-- ['<Tab>'] = cmp.mapping.select_next_item(),
		["<Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) ~= 0 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true), "")
			else
				fallback()
			end
		end,
		["<S-Tab>"] = function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#available"](1) ~= 0 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true), "")
			else
				fallback()
			end
		end,
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "vsnip" }, -- For vsnip users.
		-- { name = 'luasnip' }, -- For luasnip users.
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
	}, {
		{ name = "buffer" },
	}),
})

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})
--- End find fix
require('treesitter_config')
require('telescope_config')
require('trouble_config')
require('project_config')
require('v_git_config')
require('nvim_tree_config')
require('vim_test_config')
require('bufferline_config')
require('dashboard_config')
require('spellsitter').setup()
require('stabilize').setup()
require('tabout').setup()
require "lsp_signature".setup()
require("todo-comments").setup()
require('dap-go').setup()
require("dapui").setup()
EOF

" NerdCommenter
 let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
 let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
 let g:NERDCustomDelimiters = { 'ts': { 'left': '//','right': '' } }
 nmap <C-_> <Plug>NERDCommenterToggle
 vmap <C-_> <Plug>NERDCommenterToggle<CR>gv



