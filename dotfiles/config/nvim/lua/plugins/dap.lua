local dap = require("dap")

vim.api.nvim_set_hl(0, "DapBreakpointRed", { bg = "", fg = "#E06C75" })
vim.api.nvim_set_hl(0, "DapBreakpointGreen", { bg = "", fg = "#98C379" })
vim.api.nvim_set_hl(0, "DapBreakpointYellow", { bg = "", fg = "#E5C07B" })

vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointRed", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DapBreakpointYellow", linehl = "", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "ﲀ", texthl = "DapBreakpointYellow", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "", texthl = "DapBreakpointGreen", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRed", linehl = "", numhl = "" })

-- dap.adapters.chrome = {
-- type = "executable",
-- command = "node",
-- args = { os.getenv("HOME") .. "/vscode-chrome-debug/out/src/chromeDebug.js" },
-- }

-- dap.configurations.javascript = { -- change this to javascript if needed
-- {
-- type = "chrome",
-- request = "attach",
-- program = "${file}",
-- cwd = vim.fn.getcwd(),
-- sourceMaps = true,
-- protocol = "inspector",
-- port = 9222,
-- webRoot = "${workspaceFolder}",
-- },
-- }

-- dap.configurations.typescript = { -- change to typescript if needed
-- {
-- type = "chrome",
-- request = "attach",
-- program = "${file}",
-- cwd = vim.fn.getcwd(),
-- sourceMaps = true,
-- protocol = "inspector",
-- port = 9222,
-- webRoot = "${workspaceFolder}",
-- },
-- }
-- chrome has to be started with a remote debugging port, ie: google-chrome-stable --remote-debugging-port=9222 --user-data-dir=remote-profile

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/vscode-node-debug2/out/src/nodeDebug.js" },
}
dap.configurations.typescript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
		skipFiles = { "<node_internals>/**", "**/node_modules/**" },
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}
