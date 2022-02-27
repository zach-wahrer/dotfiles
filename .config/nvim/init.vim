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
set number                      " Show line numbers
set showmatch                   " Show matching brackets
syntax on                       " Syntax highlighting
set wrap                        " Wrap lines of text
set ttyfast                     " Speed up scrolling
set laststatus=2                " Show status bar
set matchpairs+=<:>             " Hightlight matching brackets
set wildmode=longest,list       " Bash like tab completions
set clipboard+=unnamedplus      " Use system clipboard
set cursorline                  " Highlight current cursorline
set updatetime=100 " Time it takes to write to swap / update git gutter
let mapleader="\<SPACE>" " Map the leader key to SPACE
set autowrite
set autochdir

" Spacing
set tabstop=4			" Number of cols occupied by tab
set expandtab			" Converts tabs to whitespace 
set autoindent			" Indent new line the same as previous
set shiftwidth=4		" Width for autoindents
set cc=80			" Set 80 column border
filetype plugin indent on	" Auto-indenting depending on file type

" Search
set ignorecase			" Case insensitive searching

" Mouse
set scrolloff=5			" Display lines above/below when scrolling w/ mouse
set mouse=v			" Enable paste with middle mouse button
set mouse+=a 			" Enable mouse in all modes

" Colors
set termguicolors
let g:onedark_config = {
    \ 'style': 'warmer',
\}
colorscheme onedark

" Status Bar
lua << EOF
require('lualine').setup {
 options = {
    theme = 'onedark'
  }   
}
EOF

" Load LSP
lua require("lsp_config")

" TreeSitter
"lua << EOF
" require'nvim-treesitter.configs'.setup {
"  ensure_installed = {"go", "bash", "javascript", "json", "lua", "python", "typescript", "vue"},
"  sync_install = false,
"  highlight = {
"    enable = true,
"    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
"    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
"    -- Using this option may slow down your editor, and you may see some duplicate highlights.
"    -- Instead of true it can also be a list of languages
"    additional_vim_regex_highlighting = false,
"  },
"}
"EOF
" Folding
" set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()
" set foldlevel=1

" GO
" disable all linters as that is taken care of by coc.nvim
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []

" run go imports on file save
let g:go_fmt_command = "goimports"

" automatically highlight variable your cursor is on
let g:go_auto_sameids = 0

" syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" keybinds
autocmd BufEnter *.go nmap <leader>t  <Plug>(go-test)
