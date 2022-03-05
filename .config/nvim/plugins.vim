call plug#begin()
Plug 'neovim/nvim-lspconfig' " LSP
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' } " Navigator dep
Plug 'ray-x/navigator.lua' " Navigator
Plug 'navarasu/onedark.nvim' " Theme
Plug 'nvim-lualine/lualine.nvim'  " Status Bar
Plug 'kyazdani42/nvim-web-devicons'  " Lualine, Barbar, vgit, nvim-tree
Plug 'akinsho/bufferline.nvim' " Buffer management
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter
Plug 'ray-x/go.nvim' " Go
Plug 'buoto/gotests-vim' " Go Tests
Plug 'vim-test/vim-test' " Vim-test
Plug 'tpope/vim-dispatch' " Vim-test dep
Plug 'skywind3000/asyncrun.vim' " Vim-test dep
Plug 'ahmedkhalf/project.nvim' " Project management
Plug 'nvim-lua/plenary.nvim' " Telescope, vgit req
Plug 'tanvirtin/vgit.nvim' "Vgit
Plug 'nvim-telescope/telescope.nvim' " Finder
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " Telescope req
" Plug 'rmagatti/auto-session' " Session management
Plug 'preservim/nerdcommenter' " Nerd Commenter
Plug 'frazrepo/vim-rainbow' " Rainbow tags
Plug 'jiangmiao/auto-pairs' " Auto pairs
Plug 'dstein64/nvim-scrollview', { 'branch': 'main' } " Scroll bar
Plug 'Pocco81/AutoSave.nvim' " AutoSave
Plug 'kyazdani42/nvim-tree.lua' " File browswer
Plug 'hrsh7th/cmp-nvim-lsp' " Completions
Plug 'hrsh7th/cmp-buffer' " Completions
Plug 'hrsh7th/cmp-path' " Completions
Plug 'hrsh7th/cmp-cmdline' " Completions
Plug 'hrsh7th/nvim-cmp' " Completions
Plug 'hrsh7th/cmp-vsnip' " Snips
Plug 'hrsh7th/vim-vsnip' " Snips
Plug 'mg979/vim-visual-multi' " Multi cursors
call plug#end()
