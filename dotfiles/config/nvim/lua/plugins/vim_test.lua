local M = {
	"vim-test/vim-test",
	event = "VeryLazy",
}

function M.config()
	vim.g["test#go#runner"] = "richgo"
	vim.g["test#strategy"] = "shtuff"
	vim.g["shtuff_receiver"] = "devrunner"

	vim.g["test#custom_transformations"] = { ShtuffTransform }
	vim.g["test#transformation"] = "shtuff"
end

function ShtuffTransform(cmd)
	if string.find(cmd, vim.g["test#go#runner"]) then
		return "cd " .. vim.fn.getcwd() .. " && " .. cmd
	end

	return cmd
end

return M
