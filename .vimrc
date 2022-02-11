" System
set nocompatible		" Disable compatibility with vi
set noswapfile			" Disable swapfile
set backupdir=~/.cache/nvim	" Directory to store backup files

" Interface
set spell spelllang=en_us 	" Enable spell check
set conceallevel=2 		" Conceal markdown
set title			" Show title
set number			" Show line numbers
set showmatch			" Show matching brackets
syntax on			" Syntax highlighting
set wrap			" Wrap lines of text
set ttyfast 			" Speed up scrolling
set laststatus=2		" Show status bar
set matchpairs+=<:>		" Hightlight matching brackets
set wildmode=longest,list	" Bash like tab completions
set clipboard=unnamedplus	" Use system clipboard
set cursorline			" Highlight current cursorline

" Split
set splitright
set splitbelow

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
set mouse=a 			" Enable mouse in all modes

" Plugins
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

" Colors
set termguicolors
syntax enable
 let g:onedark_config = {
     \ 'style': 'darker',
\}
colorscheme onedark

" NerdTree
augroup nerdtree_open
    autocmd!
    autocmd VimEnter * NERDTree | wincmd p
augroup END
nnoremap <silent> <C-k><C-a> :NERDTreeToggle<CR>
let g:NERDTreeWinSize=50
let NERDTreeShowHidden=1
