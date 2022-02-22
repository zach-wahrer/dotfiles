" System
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
set clipboard+=unnamedplus	" Use system clipboard
set cursorline			" Highlight current cursorline
set updatetime=100 " Time it takes to write to swap / update git gutter
let mapleader="\<SPACE>" " Map the leader key to SPACE
set autowrite
set autochdir

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
set mouse+=a 			" Enable mouse in all modes

" Panels
" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Plugins
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

" Fuzzy Finder
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

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
let g:NERDTreeWinSize=50
let NERDTreeShowHidden=1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>

" NerdCommenter
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" Go
au FileType go set noexpandtab
au FileType tgo set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'staticcheck', 'gosec']
let g:go_addtags_transform = "camelcase"
au FileType go nmap <A-q> :GoCoverageToggle<CR>
nmap <C-g> :GoTests<CR>
autocmd BufEnter *.go nmap <A-a>  :TestFile<CR>
autocmd BufEnter *.go nmap <A-t> :TestNearest<CR>
autocmd BufEnter *.go nmap <A-q> :TestLast<CR>

" Barbar
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>

" Vgit
lua << EOF
require('vgit').setup({
      keymaps = {
        ['n <C-k>'] = 'hunk_up',
        ['n <C-j>'] = 'hunk_down',
        ['n <A-b>'] = 'buffer_gutter_blame_preview',
        ['n <A-h>'] = 'buffer_history_preview',
      },
      settings = {
        hls = {
          GitBackgroundPrimary = 'NormalFloat',
          GitBackgroundSecondary = {
            gui = nil,
            fg = nil,
            bg = nil,
            sp = nil,
            override = false,
          },
          GitBorder = 'LineNr',
          GitLineNr = 'LineNr',
          GitComment = 'Comment',
          GitSignsAdd = {
            gui = nil,
            fg = '#d7ffaf',
            bg = nil,
            sp = nil,
            override = false,
          },
          GitSignsChange = {
            gui = nil,
            fg = '#7AA6DA',
            bg = nil,
            sp = nil,
            override = false,
          },
          GitSignsDelete = {
            gui = nil,
            fg = '#e95678',
            bg = nil,
            sp = nil,
            override = false,
          },
          GitSignsAddLn = 'DiffAdd',
          GitSignsDeleteLn = 'DiffDelete',
          GitWordAdd = {
            gui = nil,
            fg = nil,
            bg = '#5d7a22',
            sp = nil,
            override = false,
          },
          GitWordDelete = {
            gui = nil,
            fg = nil,
            bg = '#960f3d',
            sp = nil,
            override = false,
          },
        },
        live_blame = {
          enabled = true,
          format = function(blame, git_config)
            local config_author = git_config['user.name']
            local author = blame.author
            if config_author == author then
              author = 'You'
            end
            local time = os.difftime(os.time(), blame.author_time)
              / (60 * 60 * 24 * 30 * 12)
            local time_divisions = {
              { 1, 'years' },
              { 12, 'months' },
              { 30, 'days' },
              { 24, 'hours' },
              { 60, 'minutes' },
              { 60, 'seconds' },
            }
            local counter = 1
            local time_division = time_divisions[counter]
            local time_boundary = time_division[1]
            local time_postfix = time_division[2]
            while time < 1 and counter ~= #time_divisions do
              time_division = time_divisions[counter]
              time_boundary = time_division[1]
              time_postfix = time_division[2]
              time = time * time_boundary
              counter = counter + 1
            end
            local commit_message = blame.commit_message
            if not blame.committed then
              author = 'You'
              commit_message = 'Uncommitted changes'
              return string.format(' %s • %s', author, commit_message)
            end
            local max_commit_message_length = 255
            if #commit_message > max_commit_message_length then
              commit_message = commit_message:sub(1, max_commit_message_length) .. '...'
            end
            return string.format(
              ' %s, %s • %s',
              author,
              string.format(
                '%s %s ago',
                time >= 0 and math.floor(time + 0.5) or math.ceil(time - 0.5),
                time_postfix
              ),
              commit_message
            )
          end,
        },
        live_gutter = {
          enabled = true,
        },
        authorship_code_lens = {
          enabled = true,
        },
        screen = {
          diff_preference = 'unified',
        },
        project_diff_preview = {
          keymaps = {
            buffer_stage = 's',
            buffer_unstage = 'u',
            stage_all = 'a',
            unstage_all = 'd',
            reset_all = 'r',
          },
        },
        signs = {
          priority = 10,
          definitions = {
            GitSignsAddLn = {
              linehl = 'GitSignsAddLn',
              texthl = nil,
              numhl = nil,
              icon = nil,
              text = '',
            },
            GitSignsDeleteLn = {
              linehl = 'GitSignsDeleteLn',
              texthl = nil,
              numhl = nil,
              icon = nil,
              text = '',
            },
            GitSignsAdd = {
              texthl = 'GitSignsAdd',
              numhl = nil,
              icon = nil,
              linehl = nil,
              text = '┃',
            },
            GitSignsDelete = {
              texthl = 'GitSignsDelete',
              numhl = nil,
              icon = nil,
              linehl = nil,
              text = '┃',
            },
            GitSignsChange = {
              texthl = 'GitSignsChange',
              numhl = nil,
              icon = nil,
              linehl = nil,
              text = '┃',
            },
          },
          usage = {
            screen = {
              add = 'GitSignsAddLn',
              remove = 'GitSignsDeleteLn',
            },
            main = {
              add = 'GitSignsAdd',
              remove = 'GitSignsDelete',
              change = 'GitSignsChange',
            },
          },
        },
        symbols = {
          void = '⣿',
        },
      }
    }) 

EOF
set scl=yes

" Todo-Comments
lua << EOF
  require("todo-comments").setup {
  }
EOF

" Trouble
lua << EOF
  require("trouble").setup {
  }
EOF

" vim-rainbow
let g:rainbow_active = 1

" vim-test
let test#go#runnner = "richgo"
let test#strategy="neovim"

" Focus
" lua require("focus").setup()

" Ale
" Error and warning signs.
let g:ale_sign_error = '⤫'
let g:ale_sign_warning = '⚠'
" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

