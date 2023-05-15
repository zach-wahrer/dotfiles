local M = {
    "mfussenegger/nvim-dap",
}

function M.config()
	local dap = require("dap")

	vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpointRed", linehl = "", numhl = "" })
	vim.fn.sign_define(
	    "DapBreakpointCondition",
	    { text = "󰃻", texthl = "DapBreakpointYellow", linehl = "", numhl = "" }
	)
	vim.fn.sign_define("DapLogPoint", { text = "󰞂", texthl = "DapBreakpointYellow", linehl = "", numhl = "" })
	vim.fn.sign_define("DapStopped", { text = "", texthl = "DapBreakpointGreen", linehl = "", numhl = "" })
	vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRed", linehl = "", numhl = "" })

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
end

return M
