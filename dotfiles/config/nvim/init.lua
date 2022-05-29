vim.cmd([[
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
]])

-- Optimization --
require("impatient")

-- Nvim --
require("plugins")
require("nvim")
require("color")

-- Language Configs --
require("lang.go")
require("lang.terraform")
require("lang.js")
require("lang.lua")

-- External Configs --
require("external.kitty")
require("external.i3")
