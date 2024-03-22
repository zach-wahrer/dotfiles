local M = {
	"lukas-reineke/headlines.nvim",
	dependencies = "nvim-treesitter/nvim-treesitter",
	ft = "markdown",
}

function M.config()
	require("headlines").setup({
		markdown = {
			headline_highlights = {
				"MarkdownHeadline1",
				"MarkdownHeadline2",
				"MarkdownHeadline3",
				"MarkdownHeadline4",
				"MarkdownHeadline5",
				"MarkdownHeadline6",
			},
			bullet_highlights = {
				"Black",
			},
			-- bullets = { "󰲡", "󰲣", "󰲥", "󰲧", "󰲩", "󰲫" },
			bullets = { "󰁱" },
			codeblock_highlight = "MarkdownCodeBlock",
			dash_highlight = "MarkdownDash",
			dash_string = "-",
			quote_highlight = "MarkdownQuote",
			quote_string = "┃",
			fat_headlines = false,
			fat_headline_upper_string = "▃",
			fat_headline_lower_string = "▀",
		},
	})
end

return M
