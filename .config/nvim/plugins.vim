call plug#begin()
Plug 'neovim/nvim-lspconfig' " LSP
Plug 'navarasu/onedark.nvim' " Theme
Plug 'nvim-lualine/lualine.nvim'  " Status Bar
Plug 'kyazdani42/nvim-web-devicons'  " Status Bar
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter
Plug 'neoclide/coc.nvim', {'branch': 'release'} " COC
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
call plug#end()
