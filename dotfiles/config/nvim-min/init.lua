vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--single-branch",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins", {
	defaults = { lazy = false },
	install = { colorscheme = { "fluoromachine" } },
	checker = { enabled = false },
})
require("config")
require("mapping")
require("colors")
