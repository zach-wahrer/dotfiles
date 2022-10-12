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

function M.debugSetEnvironment()
	local envFiles = {
		"deploy/local/.env",
		"deploy/local/.source.env",
		"deploy/local/.compiled.env",
		"../../.secret.env",
	}
	for _, file in ipairs(envFiles) do
		if M.fileExists(file) then
			vim.cmd([[Dotenv ]] .. file)
		end
	end
end

function M.fileExists(name)
	local f = io.open(name, "r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end

function M.toScratch()
	vim.ui.input({ prompt = "enter command", completion = "command" }, function(input)
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
		vim.ui.input({ prompt = "enter file to diff", completion = "file" }, function(input)
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

function M.searchWordUnderCursorForward()
	vim.fn.execute("normal! *N)")
	require("hlslens").start()
	require("mini.map").refresh()
end

function M.searchWordUnderCursorBackward()
	vim.fn.execute("normal! #N)")
	require("hlslens").start()
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

return M
