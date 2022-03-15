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
require('go/delve_config')
require('terraform/terraform_config')
require('js/js_config')

-- Plugin Configs --
require('betterbuffer_config')
require('lualine_config')
require('lua_config')
require('lsp_config')
require('prettier_config')
require('nvm_cmp_config')
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
EOF

" NerdCommenter
 let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
 let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
 let g:NERDCustomDelimiters = { 'ts': { 'left': '//','right': '' } }
 nmap <C-_> <Plug>NERDCommenterToggle
 vmap <C-_> <Plug>NERDCommenterToggle<CR>gv



