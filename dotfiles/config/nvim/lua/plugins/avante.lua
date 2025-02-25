local M = {

	"yetone/avante.nvim",
	event = "VeryLazy",
	lazy = false,
	version = false, -- set this to "*" if you want to always pull the latest change, false to update on release
	opts = {
		-- add any opts here
	},
	-- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
	build = "make",
	-- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
	dependencies = {
		"stevearc/dressing.nvim",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		--- The below dependencies are optional,
		"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
		{
			-- support for image pasting
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				-- recommended settings
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = {
						insert_mode = true,
					},
					-- required for Windows users
					use_absolute_path = true,
				},
			},
		},
		{
			-- Make sure to set this up properly if you have lazy=true
			'MeanderingProgrammer/render-markdown.nvim',
			opts = {
				file_types = { "markdown", "Avante" },
			},
			ft = { "markdown", "Avante" },
		},
	},
}

function M.config()
	local function close_avante_windows()
		local windows = vim.api.nvim_list_wins()

		for _, win in ipairs(windows) do
			if vim.api.nvim_win_is_valid(win) then
				local buf = vim.api.nvim_win_get_buf(win)
				local ft = vim.bo[buf].filetype
				local name = vim.api.nvim_buf_get_name(buf)

				if ft and string.find(string.lower(ft), string.lower("avante")) and (name == "" or name == "[No Name]") then
					vim.api.nvim_win_close(win, true)

					if vim.api.nvim_buf_is_valid(buf) then
						vim.api.nvim_buf_delete(buf, { force = true })
					end
				end
			end
		end
	end

	vim.api.nvim_create_user_command('AvanteClose', function()
		close_avante_windows()
	end, {})

	require("avante").setup()

end

return M
