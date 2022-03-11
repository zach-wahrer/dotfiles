set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

" Plugins
if filereadable(expand("~/.config/nvim/plugins.vim"))
    source ~/.config/nvim/plugins.vim
endif

" Interface
set spell spelllang=en_us       " Enable spell check
set conceallevel=2              " Conceal markdown
set title                       " Show title
set relativenumber              " Show line numbers
set showmatch                   " Show matching brackets
syntax on                       " Syntax highlighting
set wrap                        " Wrap lines of text
set ttyfast                     " Speed up scrolling
set laststatus=2                " Show status bar
set matchpairs+=<:>             " Hightlight matching brackets
set wildmode=longest,list       " Bash like tab completions
set clipboard+=unnamedplus      " Use system clipboard
set cursorline                  " Highlight current cursor line
set updatetime=200 				" Time it takes to write to swap / update git gutter
let mapleader="\<SPACE>" 		" Map the leader key to SPACE
set autowrite
set autoread
nnoremap <leader>w :w<CR>
nnoremap <X1Mouse> <C-O>
nnoremap <X2Mouse> <C-I>
nnoremap <leader>p "0p

filetype plugin indent on	" Auto-indenting depending on file type

" GO 
set tabstop=4								" Number of cols occupied by tab
autocmd Filetype go set expandtab			" Converts tabs to whitespace 
set autoindent								" Indent new line the same as previous
set shiftwidth=4							" Width for autoindents
let g:go_addtags_transform = 'camelcase'
autocmd BufEnter *.go nmap <leader>ggt :GoTests<CR>
autocmd BufEnter *.go nmap <leader>gat :GoAddTags<CR>
autocmd BufEnter *.go nmap <leader>gai :GoIfErr<CR>
autocmd BufEnter *.go nmap <leader>gc :GoCoverageToggle<CR> 
autocmd BufEnter *.go nmap <leader>gf :GoFillStruct<CR>
autocmd BufEnter *.go nmap <leader>gt :GoTest<CR>
autocmd BufEnter *.go nmap <leader>ga :GoAlternate<CR>

" Delve
let g:delve_new_command = "new"
autocmd BufEnter *.go nmap <leader>db :DlvToggleBreakpoint<CR>
autocmd BufEnter *.go nmap <leader>dt :DlvTest<CR>
autocmd BufEnter *.go nmap <leader>dd :DlvDebug<CR>

" Terraform
autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()

" JS/TS/VUE
au FileType ts set ts=4 sw=4 sts=0 autoindent
au FileType vue set ts=4 sw=4 sts=0 autoindent
au FileType ts set ts=4 sw=4 sts=0 autoindent
au FileType vue set ts=4 sw=4 sts=0 autoindent
autocmd BufWritePre *.ts EslintFixAll
autocmd BufWritePre *.vue EslintFixAll
autocmd BufWritePre *.js EslintFixAll


" Search
set ignorecase			" Case insensitive searching

" Mouse
set mouse=v				" Enable paste with middle mouse button
set mouse=a 			" Enable mouse in all modes

" Colors
set termguicolors
let g:onedark_config = {
    \ 'style': 'warmer',
\}
colorscheme onedark
hi Search guibg=Cyan
hi SpellBad guibg=gray20 guifg=Orange

set completeopt=menu,menuone,noselect " For LSP/Complete

lua << EOF
--- Format for autocmds
---vim.api.nvim_exec([[autocmd BufWritePre *.lua :<leader>fo<CR>]],false)
require('betterbuffer_config')
require('lualine_config')
require('lua_config')
require('lsp_config')
require('prettier_config')
require('nvm_cmp_config')
require('treesitter_config')
require('telescope_config')
require('project_config')
require('v_git_config')
require('tabout').setup()
require('spellsitter').setup()
require('nvim_tree_config')
require('vim_test_config')
require('bufferline_config')
EOF

" NerdCommenter
 let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
 let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
 let g:NERDCustomDelimiters = { 'ts': { 'left': '//','right': '' } }
 nmap <C-_> <Plug>NERDCommenterToggle
 vmap <C-_> <Plug>NERDCommenterToggle<CR>gv



