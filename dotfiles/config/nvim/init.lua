vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
]])

-- Optimization --
require("impatient_config")

-- Nvim --
require("plugins")
require("nvim_config")
require("color_config")

-- Language Configs --
require("go/go_config")
require("terraform/terraform_config")
require("js/js_config")
require("lua/lua_config")

-- Plugin Configs --
require("dap_config")
require("betterbuffer_config")
require("lualine_config")
require("lsp_config")
require("prettier_config")
require("diff_view_config")
require("treesitter_config")
require("telescope_config")
require("trouble_config")
require("project_config")
require("v_git_config")
require("lazy_git_config")
require("nvim_tree_config")
require("vim_test_config")
require("bufferline_config")
require("dashboard_config")
require("nvm_cmp_config")
require("kommentary_config")
require("undotree_config")
require("spelunker_config")
require("surround_config")
require("scrollbar_config")
require("kitty_config")
require("i3_config")

-- Plugins --
require("nvim-autopairs").setup({})
require("spellsitter").setup()
require("stabilize").setup()
require("tabout").setup()
require("lsp_signature").setup()
require("todo-comments").setup()
require("dap-go").setup()
require("dapui").setup()
require("remember").setup({})
require("neoscroll").setup({})
