local M = {
	"echasnovski/mini.nvim",
	-- event = "VeryLazy", -- Cannot lazy load if using "mini.starter"
}

function M.config()
	-- require("mini.cursorword").setup()
	-- require("mini.bufremove").setup()
	-- require("mini.bracketed").setup()
	-- require("mini.move").setup()
	-- require("mini.pairs").setup()
	require("mini.surround").setup()
	-- require("mini.jump2d").setup({
	-- view = {
	-- 	dim = true,
	-- },
	-- 	mappings = {
	-- 		start_jumping = "<Backspace>",
	-- 	},
	-- })

	require("mini.comment").setup({
		options = {
			ignore_blank_line = true,
		},
		mappings = {
			comment = "<C-_>",
			comment_line = "<C-_>",
			comment_visual = "<C-_>",
			-- For non-alacritty terms
			-- comment = "<C-/>",
			-- comment_line = "<C-/>",
			-- comment_visual = "<C-/>",
		},
	})

	require("mini.indentscope").setup({
		symbol = "▏",
		draw = { animation = require("mini.indentscope").gen_animation.none() },
	})

	local hipatterns = require("mini.hipatterns")
	hipatterns.setup({
		highlighters = {
			-- -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
			-- fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
			-- hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
			-- todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
			-- note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

			-- Highlight hex color strings (`#rrggbb`) using that color
			hex_color = hipatterns.gen_highlighter.hex_color(),
		},
	})

	local map = require("mini.map")
	map.setup({
		integrations = {
			map.gen_integration.builtin_search(),
			map.gen_integration.gitsigns(),
			map.gen_integration.diagnostic(),
		},
	})
	-- map.toggle()

	Colors = require("colors")
	local starter = require("mini.starter")
	starter.setup({
		header = function()
			local cfgPath = vim.fn.stdpath("config")
			local f, err = io.open(cfgPath .. "/slides/dashboard.cat")
			if f == nil then
				return err
			end
			local content = f:read("*all")
			f:close()
			return content
		end,
		-- items = { starter.sections.telescope() },
		items = { name = " ", action = "", section = "" },
		footer = "",
		silent = true,
	})
	vim.api.nvim_set_hl(0, "MiniStarterHeader", { fg = Colors.purple })
end

return M
