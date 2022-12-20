local M = { url = "https://gitlab.com/madyanov/svart.nvim" }

function M.config()
	require("svart").configure({
		label_location = 1,
		search_update_register = false,
	})
end

return M
