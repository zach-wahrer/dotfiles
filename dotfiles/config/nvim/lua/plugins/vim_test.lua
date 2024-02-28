local M = {
	"vim-test/vim-test",
	event = "VeryLazy",
	dependencies = "preservim/vimux",
}

function M.config()
	vim.g["test#go#runner"] = "richgo"
	vim.g["test#strategy"] = "vimux"

	vim.g["test#custom_transformations"] = { WeztermTransform }
	vim.g["test#transformation"] = "wezterm"
end

function WeztermTransform(cmd)
	if string.find(cmd, vim.g["test#go#runner"]) then
		return "cd " .. vim.fn.getcwd() .. " && " .. cmd
	end

	return cmd
end

return M
