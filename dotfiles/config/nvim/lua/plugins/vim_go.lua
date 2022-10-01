vim.g.go_addtags_transform = "camelcase"
vim.g["go_metalinter_autosave_enabled"] = {
	"gofmt",
	"govet",
	"revive",
	"errcheck",
	-- "deadcode",
	"gosimple",
	"ineffassign",
	"staticcheck",
	-- "structcheck",
	"typecheck",
	"unused",
	-- "varcheck",
	"bodyclose",
	"dogsled",
	"goconst",
	"gocyclo",
	"importas",
	-- "rowserrcheck",
	-- "sqlclosecheck",
	"misspell",
	"gosec",
}
vim.g["go_metalinter_command"] = "golangci-lint"
vim.g["go_metalinter_autosave"] = 1
vim.g["go_jump_to_error"] = 0
vim.g["go_fmt_command"] = "gopls"
vim.g["go_fmt_autosave"] = 1
vim.g["go_mod_fmt_autosave"] = 1
vim.g["go_imports_autosave"] = 1
