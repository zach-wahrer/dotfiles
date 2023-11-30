local wezterm = require("wezterm")
local module = {}

function module.apply_to_config(config)
	-- config.color_scheme = "Galizur"
	config.font = wezterm.font("Sudo")

{%@@ if profile == "red-wolf" @@%}
	config.font_size = 13
{%@@ else @@%}
	config.font_size = 15
{%@@ endif @@%}
	config.tab_bar_at_bottom = true
	config.hide_tab_bar_if_only_one_tab = true
	config.use_fancy_tab_bar = false
	config.enable_scroll_bar = true

	Colors = {
		-- OneDark Darker Colors
		-- black = "#0e1013",
		-- bg0 = "#1f2329",
		-- bg1 = "#282c34",
		-- bg2 = "#30363f",
		-- bg3 = "#323641",
		-- bg_d = "#181b20",
		-- bg_blue = "#61afef",
		-- bg_yellow = "#e8c88c",
		-- fg = "#a0a8b7",
		-- purple = "#bf68d9",
		-- green = "#8ebd6b",
		-- orange = "#cc9057",
		-- blue = "#4fa6ed",
		-- yellow = "#e2b86b",
		-- cyan = "#48b0bd",
		-- red = "#e55561",
		-- grey = "#535965",
		-- light_gray = "#7a818e",
		-- dark_cyan = "#266269",
		-- dark_red = "#8b3434",
		-- dark_yellow = "#835d1a",
		-- dark_purple = "#7e3992",
		-- diff_add = "#272e23",
		-- diff_delete = "#2d2223",
		-- diff_change = "#172a3a",
		-- diff_text = "#274964",

		-- Fluormachine Colors
		black = "#0e1013",
		bg0 = "#1f2329",
		bg1 = "#282c34",
		bg2 = "#30363f",
		bg3 = "#323641",
		bg_d = "#181b20",
		bg_blue = "#3A89FF",
		bg_yellow = "#FFF700",
		fg = "#a0a8b7",
		purple = "#AF6DF9",
		pink = "#FC199A",
		green = "#72f1b8",
		orange = "#ff8b39",
		blue = "#3A47FF",
		yellow = "#FFCC00",
		cyan = "#61E2FF",
		red = "#fe4450",
		grey = "#535965",
		light_gray = "#7a818e",
		dark_cyan = "#0081A1",
		dark_red = "#f7202e",
		dark_yellow = "#9A7B00",
		dark_purple = "#8420f5",
		dark_green = "#0ff58e",

		-- Personal
		dark_grey = "#191919",
	}

	config.colors = {
		-- The default text color
		foreground = Colors.fg,
		-- The default background color
		background = Colors.bg0,

		-- Overrides the cell background color when the current cell is occupied by the
		-- cursor and the cursor style is set to Block
		cursor_bg = Colors.purple,
		-- Overrides the text color when the current cell is occupied by the cursor
		-- cursor_fg = Colors.purple,
		-- Specifies the border color of the cursor when the cursor style is set to Block,
		-- or the color of the vertical or horizontal bar when the cursor style is set to
		-- Bar or Underline.
		cursor_border = Colors.purple,

		-- the foreground color of selected text
		selection_fg = Colors.purple,
		-- the background color of selected text
		selection_bg = Colors.black,

		-- The color of the scrollbar "thumb"; the portion that represents the current viewport
		scrollbar_thumb = Colors.dark_purple,

		-- The color of the split lines between panes
		split = Colors.purple,

		ansi = {
			Colors.black,
			Colors.red,
			Colors.green,
			Colors.dark_green,
			Colors.blue,
			Colors.purple,
			Colors.cyan,
			Colors.light_gray,
		},
		brights = {
			Colors.bg3,
			Colors.dark_red,
			Colors.green,
			Colors.yellow,
			Colors.dark_cyan,
			Colors.pink,
			Colors.cyan,
			Colors.fg,
		},

		-- Colors for copy_mode and quick_select
		-- available since: 20220807-113146-c2fee766
		-- In copy_mode, the color of the active text is:
		-- 1. copy_mode_active_highlight_* if additional text was selected using the mouse
		-- 2. selection_* otherwise
		copy_mode_active_highlight_bg = { Color = "#000000" },
		-- use `AnsiColor` to specify one of the ansi color palette values
		-- (index 0-15) using one of the names "Black", "Maroon", "Green",
		--  "Olive", "Navy", "Purple", "Teal", "Silver", "Grey", "Red", "Lime",
		-- "Yellow", "Blue", "Fuchsia", "Aqua" or "White".
		copy_mode_active_highlight_fg = { AnsiColor = "Black" },
		copy_mode_inactive_highlight_bg = { Color = Colors.pink },
		copy_mode_inactive_highlight_fg = { AnsiColor = "White" },

		quick_select_label_bg = { Color = "peru" },
		quick_select_label_fg = { Color = "#ffffff" },
		quick_select_match_bg = { AnsiColor = "Navy" },
		quick_select_match_fg = { Color = "#ffffff" },

		tab_bar = {
			-- The color of the strip that goes along the top of the window
			-- (does not apply when fancy tab bar is in use)
			background = Colors.bg0,

			-- The active tab is the one that has focus in the window
			active_tab = {
				-- The color of the background area for the tab
				bg_color = Colors.dark_purple,
				-- The color of the text for the tab
				fg_color = Colors.fg,

				-- Specify whether you want "Half", "Normal" or "Bold" intensity for the
				-- label shown for this tab.
				-- The default is "Normal"
				intensity = "Bold",

				-- Specify whether you want "None", "Single" or "Double" underline for
				-- label shown for this tab.
				-- The default is "None"
				underline = "None",

				-- Specify whether you want the text to be italic (true) or not (false)
				-- for this tab.  The default is false.
				italic = false,

				-- Specify whether you want the text to be rendered with strikethrough (true)
				-- or not for this tab.  The default is false.
				strikethrough = false,
			},

			-- Inactive tabs are the tabs that do not have focus
			inactive_tab = {
				bg_color = Colors.bg0,
				fg_color = Colors.fg,

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `inactive_tab`.
			},

			-- You can configure some alternate styling when the mouse pointer
			-- moves over inactive tabs
			inactive_tab_hover = {
				bg_color = Colors.purple,
				fg_color = Colors.black,
				italic = true,

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `inactive_tab_hover`.
			},

			-- The new tab button that let you create new tabs
			new_tab = {
				bg_color = Colors.dark_purple,
				fg_color = Colors.black,

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `new_tab`.
			},

			-- You can configure some alternate styling when the mouse pointer
			-- moves over the new tab button
			new_tab_hover = {
				bg_color = Colors.purple,
				fg_color = Colors.black,
				italic = true,

				-- The same options that were listed under the `active_tab` section above
				-- can also be used for `new_tab_hover`.
			},
		},
	}

	config.inactive_pane_hsb = {
  		saturation = 1,
  		brightness = 0.75,
	}

	-- config.window_background_opacity = 0.9
end

return module
