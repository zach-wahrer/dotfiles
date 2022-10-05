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

function M.searchWordUnderCursorForward()
	vim.fn.execute("normal! *N)")
	require("hlslens").start()
end

function M.searchWordUnderCursorBackward()
	vim.fn.execute("normal! #N)")
	require("hlslens").start()
end

return M
