vim.cmd([[
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

call plug#begin()

"""""" THEMES """"""
Plug 'navarasu/onedark.nvim'
Plug 'Th3Whit3Wolf/one-nvim'
Plug 'marko-cerovac/material.nvim'
Plug 'yonlu/omni.vim' 
Plug 'sainnhe/edge' 
Plug 'PHSix/nvim-hybrid'
Plug 'olimorris/onedarkpro.nvim'
Plug 'rmehri01/onenord.nvim'

"""""" REQS """"""
Plug 'kyazdani42/nvim-web-devicons'  " Lualine, Barbar, vgit, nvim-tree
Plug 'nvim-lua/plenary.nvim' " Telescope, vgit, todo-comments req
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' } " Telescope req
Plug 'jose-elias-alvarez/null-ls.nvim' " Prettier req
Plug 'vim-denops/denops.vim' " Req for denops-docker
Plug 'kamykn/popup-menu.nvim' " Req for spelunker
Plug 'tpope/vim-repeat' " Req for lightspeed

"""""" LSP """"""
Plug 'neovim/nvim-lspconfig' 
Plug 'folke/lsp-colors.nvim' " Add missing lsp colors
Plug 'ray-x/lsp_signature.nvim' " Show func signature

"""""" INTERFACE """"""
Plug 'nvim-lualine/lualine.nvim'  " Status Bar
Plug 'akinsho/bufferline.nvim' " Buffer management
Plug 'ahmedkhalf/project.nvim' " Project management
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Treesitter
Plug 'nvim-telescope/telescope.nvim' " Finder
Plug 'b3nj5m1n/kommentary' " Comment
Plug 'windwp/nvim-autopairs' " Auto pairs
Plug 'dstein64/nvim-scrollview', { 'branch': 'main' } " Scroll bar
Plug 'kyazdani42/nvim-tree.lua' " File browser
Plug 'p00f/nvim-ts-rainbow' " Rainbow brackets
Plug 'mg979/vim-visual-multi' " Multi cursors
Plug 'psliwka/vim-smoothie' " Smooth scrolling
Plug 'folke/trouble.nvim' " Pretty list for diagnostics
Plug 'moll/vim-bbye' " Better buffer quit
Plug 'abecodes/tabout.nvim' " Tab out
Plug 'preservim/vimux' " Vimux for tests
Plug 'lewis6991/spellsitter.nvim' " Spell check within treesitter
Plug 'kamykn/spelunker.vim' " Spellcheck
Plug 'glepnir/dashboard-nvim' " Startup dashboard
Plug 'luukvbaal/stabilize.nvim' " Window stabilize
Plug 'folke/todo-comments.nvim' " Todo comment highlights
Plug 'gpanders/editorconfig.nvim' " Use .editorconfig files
Plug 'weilbith/nvim-code-action-menu' " Code action menu
Plug 'appelgriebsch/surround.nvim' " Surround with chars
Plug 'tversteeg/registers.nvim', { 'branch': 'main' } " Visualize registers
Plug 'mbbill/undotree' " Visualize undo tree
Plug 'arp242/undofile_warn.vim' " Warn if undoing past current 
Plug 'ggandor/lightspeed.nvim' " Faster movement

"""""" COMPLETIONS """"""
Plug 'hrsh7th/cmp-nvim-lsp' " Completions
Plug 'hrsh7th/cmp-buffer' " Completions
Plug 'hrsh7th/cmp-path' " Completions
Plug 'hrsh7th/cmp-cmdline' " Completions
Plug 'hrsh7th/nvim-cmp' " Completions
Plug 'hrsh7th/cmp-vsnip' " Snips
Plug 'hrsh7th/vim-vsnip' " Snips

"""""" LANGUAGES """"""
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " Go
Plug 'sebdah/vim-delve' " Delve
Plug 'MunifTanjim/prettier.nvim' " Prettier formatting
Plug 'ckipp01/stylua-nvim' " Lua formatting
Plug 'euclio/vim-markdown-composer' " Markdown preview

"""""" DEBUG """"""
Plug 'mfussenegger/nvim-dap' " Debug adapter
Plug 'leoluz/nvim-dap-go' " Adapt delve to dap
Plug 'David-Kunz/jester' " Jest test dap debugger
Plug 'rcarriga/nvim-dap-ui' " UI for dap

"""""" TESTING """"""
Plug 'buoto/gotests-vim'
" Plug 'hexdigest/gounit-vim' " Go Tests / Allows templates to be created
Plug 'vim-test/vim-test' " Vim-test
Plug 'tpope/vim-dispatch' " Vim-test dep
Plug 'skywind3000/asyncrun.vim' " Vim-test dep

"""""" ENV MANAGEMENT """"""
Plug 'tpope/vim-dotenv' 

"""""" GIT """"""
Plug 'tanvirtin/vgit.nvim' "Vgit
Plug 'sindrets/diffview.nvim' " Git diff view
Plug 'kdheepak/lazygit.nvim' " Lazy Git

call plug#end()
]])
