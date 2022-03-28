call plug#begin()
Plug 'neovim/nvim-lspconfig' " LSP
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' } " Navigator dep
Plug 'ray-x/navigator.lua' " Navigator
Plug 'navarasu/onedark.nvim' " Theme
Plug 'Th3Whit3Wolf/one-nvim' " Theme
Plug 'yonlu/omni.vim' " Theme
Plug 'nvim-lualine/lualine.nvim'  " Status Bar
Plug 'kyazdani42/nvim-web-devicons'  " Lualine, Barbar, vgit, nvim-tree
Plug 'akinsho/bufferline.nvim' " Buffer management
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go
Plug 'sebdah/vim-delve' " Delve
Plug 'tpope/vim-dotenv' " Env management
Plug 'buoto/gotests-vim' " Go Tests
" Plug 'hexdigest/gounit-vim' " Go Tests / Allows templates to be created
Plug 'vim-test/vim-test' " Vim-test
Plug 'tpope/vim-dispatch' " Vim-test dep
Plug 'skywind3000/asyncrun.vim' " Vim-test dep
Plug 'ahmedkhalf/project.nvim' " Project management
Plug 'nvim-lua/plenary.nvim' " Telescope, vgit, todo-comments req
Plug 'tanvirtin/vgit.nvim' "Vgit
Plug 'kdheepak/lazygit.nvim' " Lazy Git
Plug 'nvim-telescope/telescope.nvim' " Finder
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " Telescope req
Plug 'b3nj5m1n/kommentary' " Comment
Plug 'windwp/nvim-autopairs' " Auto pairs
Plug 'dstein64/nvim-scrollview', { 'branch': 'main' } " Scroll bar
Plug 'kyazdani42/nvim-tree.lua' " File browser
Plug 'p00f/nvim-ts-rainbow' " Rainbow brackets
Plug 'hrsh7th/cmp-nvim-lsp' " Completions
Plug 'hrsh7th/cmp-buffer' " Completions
Plug 'hrsh7th/cmp-path' " Completions
Plug 'hrsh7th/cmp-cmdline' " Completions
Plug 'hrsh7th/nvim-cmp' " Completions
Plug 'hrsh7th/cmp-vsnip' " Snips
Plug 'hrsh7th/vim-vsnip' " Snips
Plug 'mg979/vim-visual-multi' " Multi cursors
Plug 'psliwka/vim-smoothie' " Smooth scrolling
Plug 'folke/lsp-colors.nvim' " Add missing lsp colors
Plug 'folke/trouble.nvim' " Pretty list for diagnostics
Plug 'moll/vim-bbye' " Better buffer quit
Plug 'abecodes/tabout.nvim' " Tab out
Plug 'preservim/vimux' " Vimux for tests
Plug 'jose-elias-alvarez/null-ls.nvim' " Prettier req
Plug 'MunifTanjim/prettier.nvim' " Prettier formatting
Plug 'lewis6991/spellsitter.nvim' " Spell check with treesitter
Plug 'ckipp01/stylua-nvim' " Lua formatting
Plug 'glepnir/dashboard-nvim' " Startup dashboard
Plug 'luukvbaal/stabilize.nvim' " Window stabilize
Plug 'ray-x/lsp_signature.nvim' " Show func signature
Plug 'folke/todo-comments.nvim' " Todo comment highlights
Plug 'David-Kunz/jester' " Jest test dap debugger
Plug 'mfussenegger/nvim-dap' " Debug adapter
Plug 'leoluz/nvim-dap-go' " Adapt delve to dap
Plug 'rcarriga/nvim-dap-ui' " UI for dap
Plug 'gpanders/editorconfig.nvim' " Use .editorconfig files
Plug 'kosayoda/nvim-lightbulb' " Show lightbulb when code actions are available
Plug 'weilbith/nvim-code-action-menu' " Code action menu
Plug 'sindrets/diffview.nvim' " Git diff view
Plug 'appelgriebsch/surround.nvim' " Surround with chars
Plug 'vim-denops/denops.vim' " Req for denops-docker
Plug 'skanehira/denops-docker.vim' " Docker
call plug#end()

