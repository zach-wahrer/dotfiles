local dap = require("dap")
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
		skipFiles = { "<node_internals>/**/*.js" },
	},
	{
		-- For this to work you need to make sure the node process is started with the `--inspect` flag.
		name = "Attach to process",
		type = "node2",
		request = "attach",
		processId = require("dap.utils").pick_process,
	},
}
