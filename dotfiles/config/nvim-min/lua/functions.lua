local M = {}

function M.openAllQuickFix()
	local qf = vim.fn.getqflist()
	if #qf == 0 then
		return
	end

	local prevName = ""
	for _, v in ipairs(qf) do
		local bufName = vim.fn.bufname(v.bufnr)
		if prevName ~= bufName then
			vim.cmd([[edit ]] .. bufName)
		end
		prevName = bufName
	end
end

function M.toScratch()
	vim.ui.input({ prompt = "Enter Command: ", completion = "command" }, function(input)
		if input == nil then
			return
		elseif input == "scratch" then
			input = "echo('')"
		end
		local cmd = vim.api.nvim_exec(input, { output = true })
		local output = {}
		for line in cmd:gmatch("[^\n]+") do
			table.insert(output, line)
		end
		local buf = vim.api.nvim_create_buf(true, true)
		vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
		vim.api.nvim_win_set_buf(0, buf)
	end)
end

function M.diffOpenFileToggle()
	if vim.wo.diff then
		vim.cmd("windo diffoff")
	else
		vim.ui.input({ prompt = "Enter File to Diff: ", completion = "file" }, function(input)
			if input == nil then
				return
			end
			vim.cmd("vert diffsplit " .. input)
		end)
	end
end

function M.diffToggle()
	if vim.wo.diff then
		vim.cmd("windo diffoff")
	else
		vim.cmd("windo diffthis")
	end
end

function M.gitDiffToggle()
	if not vim.g["git_diff_toggled"] then
		vim.cmd("DiffviewFileHistory")
	else
		vim.cmd("DiffviewClose")
	end
	vim.g["git_diff_toggled"] = not vim.g["git_diff_toggled"]
end

function M.searchWordUnderCursorForward()
	vim.fn.execute("normal! *N)")
	require("mini.map").refresh()
end

function M.searchWordUnderCursorBackward()
	vim.fn.execute("normal! #N)")
	require("mini.map").refresh()
end

function M.removeSearch()
	vim.fn.execute("noh")
	require("mini.map").refresh()
end

function M.sourceAllConfigFiles()
	local cfgFilePath = vim.fn.stdpath("config") .. "/lua/**/*.lua"
	local cfgFiles = vim.split(vim.fn.glob(cfgFilePath), "\n")

	for _, file in ipairs(cfgFiles) do
		vim.fn.execute("source " .. file)
	end

	vim.notify("All config files sourced successfully.")
end

function M.findFiles(path)
	require("telescope.builtin").find_files({ cwd = path, hidden = true })
end

function M.toggleCenterScroll()
	vim.g["center_scroll"] = not vim.g["center_scroll"]
	if vim.g["center_scroll"] then
		vim.cmd("set scrolloff=999")
	else
		vim.cmd("set scrolloff=15")
	end
end

function M.scroll(command)
	vim.cmd("norm " .. command)
	if vim.g["center_after_scroll"] and vim.bo.filetype ~= "neo-tree" then
		vim.cmd("norm  zz")
	end
end

return M
