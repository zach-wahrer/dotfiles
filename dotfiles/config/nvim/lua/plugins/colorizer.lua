local M = {
	"NvChad/nvim-colorizer.lua",
}

function M.config()
	require("colorizer").setup({
		user_default_options = {
			names = false,
		},
	})
end

return M
