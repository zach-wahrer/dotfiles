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
set number              " Show line numbers
set showmatch                   " Show matching brackets
syntax on                       " Syntax highlighting
set wrap                        " Wrap lines of text
set ttyfast                     " Speed up scrolling
set laststatus=2                " Show status bar
set matchpairs+=<:>             " Hightlight matching brackets
set wildmode=longest,list       " Bash like tab completions
set clipboard+=unnamedplus      " Use system clipboard
set cursorline                  " Highlight current cursorline
set updatetime=300 " Time it takes to write to swap / update git gutter
let mapleader="\<SPACE>" " Map the leader key to SPACE
set autowrite
set autoread
nnoremap <C-C> :q<cr> 

" Default/GO Spacing
set tabstop=4			" Number of cols occupied by tab
set expandtab			" Converts tabs to whitespace 
set autoindent			" Indent new line the same as previous
set shiftwidth=4		" Width for autoindents
filetype indent plugin on	" Auto-indenting depending on file type

" JS/TS/VUE Spacing
au FileType ts set tabstop=2
au FileType vue set tabstop=2
au FileType ts set shiftwidth=2
au FileType vue set shiftwidth=2

" Search
set ignorecase			" Case insensitive searching

" Mouse
" set scrolloff=5			" Display lines above/below when scrolling w/ mouse
set mouse=v			" Enable paste with middle mouse button
set mouse=a 			" Enable mouse in all modes

" Colors
set termguicolors
let g:onedark_config = {
    \ 'style': 'warmer',
\}
colorscheme onedark
hi Search guibg=Cyan

" Status Bar
lua << EOF
require('lualine').setup {
 options = {
    theme = 'onedark'
  }   
}
EOF

" Load LSP 
lua << EOF
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'gopls', 'vuels', 'tsserver' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
EOF
set completeopt=menu,menuone,noselect

" nvim-cmp.
lua <<EOF
  -- 
  local cmp = require'cmp'

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
      ['<Tab>'] = cmp.mapping.select_next_item(),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it. 
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })
EOF


" TreeSitter
lua << EOF
require'nvim-treesitter.configs'.setup {
 ensure_installed = {"go", "bash", "javascript", "json", "lua", "python", "typescript", "vue"},
 sync_install = false,
 highlight = {
   enable = true,
   -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
   -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
   -- Using this option may slow down your editor, and you may see some duplicate highlights.
   -- Instead of true it can also be a list of languages
   additional_vim_regex_highlighting = false,
 },
}
EOF

" nvim-tree
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_highlight_opened_files = 3 
let g:nvim_tree_git_hl = 1
lua << EOF
require'nvim-tree'.setup {
  open_on_setup = true,
  open_on_tab = true,
  -- auto_close = true,
  -- hijack_unnamed_buffer_when_opening = true,
  hijack_cursor = true,
  diagnostics = {
      enable = true,
      show_on_dirs = true
  },
  view = {
    width = 50
  }
}
EOF
nnoremap <silent> <C-b> :NvimTreeToggle<CR>

" GO
lua require('go').setup()
" Goimports on save
lua vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
" keybinds
autocmd BufEnter *.go nmap <leader>c :GoCoverage<CR> 
autocmd BufEnter *.go nmap <leader>f :GoFillStruct<CR>
autocmd BufEnter *.go nmap <C-G> :GoTests<CR>

" Terraform
lua <<EOF
  require'lspconfig'.terraformls.setup{} 
EOF
autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()

" NerdCommenter
let g:NERDSpaceDelims = 1 " Add spaces after comment delimiters by default
let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

" Telescope
lua << EOF
require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
require('telescope').load_extension('fzf')
require("project_nvim").setup() 
EOF

" Project
lua require('telescope').load_extension('projects')
nnoremap <C-F> <cmd>Telescope projects<cr>

" Session Management
lua << EOF
--- require('auto-session').setup {
---     log_level = 'info',
---     auto_session_suppress_dirs = {'~/', '~/Projects'}
---  }
EOF

" vim-test
let test#go#runnner = "richgo"
let test#strategy="asyncrun_background"

" Test keybinds
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>t :TestNearest<CR>
nnoremap <leader>tt :TestLast<CR>

" vim-rainbow
let g:rainbow_active = 1

" vgit
lua << EOF
require('vgit').setup({
keymaps = {
        ['n <C-k>'] = 'hunk_up',
        ['n <C-j>'] = 'hunk_down',
        ['n <A-b>'] = 'buffer_gutter_blame_preview',
        ['n <A-h>'] = 'buffer_history_preview',
      },
})
EOF

" Bufferline
lua << EOF
require("bufferline").setup{
options = {
    max_name_length = 50,
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "NvimTree",
        text = "",
        highlight = "Directory",
        text_align = "left"
      }
    }
  }
}
EOF
" Move to previous/next
nnoremap <silent>    <A-,> :BufferLineCyclePrev<CR>
nnoremap <silent>    <A-.> :BufferLineCycleNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferLineMovePrev<CR>
nnoremap <silent>    <A->> :BufferLineMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferLineGoToBuffer 1<CR>
nnoremap <silent>    <A-2> :BufferLineGoToBuffer 2<CR>
nnoremap <silent>    <A-3> :BufferLineGoToBuffer 3<CR>
nnoremap <silent>    <A-4> :BufferLineGoToBuffer 4<CR>
nnoremap <silent>    <A-5> :BufferLineGoToBuffer 5<CR>
nnoremap <silent>    <A-6> :BufferLineGoToBuffer 6<CR>
nnoremap <silent>    <A-7> :BufferLineGoToBuffer 7<CR>
nnoremap <silent>    <A-8> :BufferLineGoToBuffer 8<CR>
nnoremap <silent>    <A-9> :BufferLineGoToBuffer<CR>

"AutoSave
lua << EOF
--local autosave = require("autosave")
--autosave.setup(
--    {
--        enabled = true,
--        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
--        events = {"InsertLeave"},
--        conditions = {
--            exists = true,
--            filename_is_not = {},
--            filetype_is_not = {},
--            modifiable = true
--        },
--        write_all_buffers = false,
--        on_off_commands = true,
--        clean_command_line_interval = 0,
--        debounce_delay = 400
--    }
-- )
EOF
