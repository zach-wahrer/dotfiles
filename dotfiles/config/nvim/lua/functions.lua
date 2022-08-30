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

return M
