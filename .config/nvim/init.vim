set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

" Plugins
if filereadable(expand("~/.config/nvim/plugins.vim"))
    source ~/.config/nvim/plugins.vim
endif

let mapleader="\<SPACE>" 	
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
-- Nvim --
require('nvim_config')

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
require('diff_view_config')
require('treesitter_config')
require('telescope_config')
require('trouble_config')
require('project_config')
require('v_git_config')
require('lazy_git_config')
require('nvim_tree_config')
require('vim_test_config')
require('vimux_config')
require('bufferline_config')
require('dashboard_config')
require('nvm_cmp_config') 
require('kommentary_config')

-- Plugins --
require('nvim-autopairs').setup{}
require('spellsitter').setup()
require('stabilize').setup()
require('tabout').setup()
require 'lsp_signature'.setup()
require('todo-comments').setup()
require('dap-go').setup()
require('dapui').setup()
require('surround').setup({})
EOF
