local wezterm = require("wezterm")
local act = wezterm.action

local wez_mod = "CTRL|SHIFT"
local wez_mod_with_alt = "CTRL|SHIFT|ALT"

local function is_inside_vim(pane)
	local tty = pane:get_tty_name()
	if tty == nil then
		return false
	end

	local success, stdout, stderr = wezterm.run_child_process({
		"sh",
		"-c",
		"ps -o state= -o comm= -t"
		.. wezterm.shell_quote_arg(tty)
		.. " | "
		.. "grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?)(diff)?$'",
	})

	return success
end

local function is_outside_vim(pane)
	return not is_inside_vim(pane)
end

local function bind_if(cond, key, mods, action)
	local function callback(win, pane)
		if cond(pane) then
			win:perform_action(action, pane)
		else
			win:perform_action(act.SendKey({ key = key, mods = mods }), pane)
		end
	end

	return { key = key, mods = mods, action = wezterm.action_callback(callback) }
end

local module = {}

function module.apply_to_config(config)
	config.keys = {
		{ key = "D",          mods = wez_mod, action = act.ShowDebugOverlay },
		-- Scrollback
		{
			key = ";",
			mods = "CTRL",
			action = act.Multiple({
				act.ClearScrollback("ScrollbackAndViewport"),
				act.SendKey({ key = "L", mods = "CTRL" }),
			}),
		},

		-- Search
		{ key = "?",          mods = wez_mod, action = act.Search({ CaseSensitiveString = "" }) },

		-- Tabs
		{ key = "Space",      mods = wez_mod, action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "w",          mods = wez_mod, action = act.CloseCurrentTab({ confirm = true }) },
		{ key = "l",          mods = wez_mod, action = act.ActivateTabRelative(1) },
		{ key = "h",          mods = wez_mod, action = act.ActivateTabRelative(-1) },
		{ key = "LeftArrow",  mods = wez_mod, action = act.MoveTabRelative(-1) },
		{ key = "RightArrow", mods = wez_mod, action = act.MoveTabRelative(1) },
		{
			key = "r",
			mods = wez_mod,
			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					-- line will be `nil` if they hit escape without entering anything
					-- An empty string if they just hit enter
					-- Or the actual line of text they wrote
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},

		-- Pane
		{ key = "Enter", mods = wez_mod,          action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "Enter", mods = wez_mod_with_alt, action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "q",     mods = wez_mod,          action = act.CloseCurrentPane({ confirm = true }) },
		{ key = "a",     mods = "CTRL",           action = act.TogglePaneZoomState },

		bind_if(is_outside_vim, "k", "CTRL", act.ActivatePaneDirection("Up")),
		bind_if(is_outside_vim, "j", "CTRL", act.ActivatePaneDirection("Down")),
		bind_if(is_outside_vim, "h", "CTRL", act.ActivatePaneDirection("Left")),
		bind_if(is_outside_vim, "l", "CTRL", act.ActivatePaneDirection("Right")),

		{ key = "LeftArrow",  mods = wez_mod,          action = act.AdjustPaneSize({ "Left", 3 }) },
		{ key = "RightArrow", mods = wez_mod,          action = act.AdjustPaneSize({ "Right", 3 }) },
		{ key = "UpArrow",    mods = wez_mod,          action = act.AdjustPaneSize({ "Up", 3 }) },
		{ key = "DownArrow",  mods = wez_mod,          action = act.AdjustPaneSize({ "Down", 3 }) },

		{ key = "LeftArrow",  mods = wez_mod_with_alt, action = act.PaneSelect({ mode = "SwapWithActive" }) },
		{ key = "RightArrow", mods = wez_mod_with_alt, action = act.PaneSelect({ mode = "SwapWithActive" }) },
		{ key = "UpArrow",    mods = wez_mod_with_alt, action = act.PaneSelect({ mode = "SwapWithActive" }) },
		{ key = "DownArrow",  mods = wez_mod_with_alt, action = act.PaneSelect({ mode = "SwapWithActive" }) },

		-- Scroll
		bind_if(is_outside_vim, "u", "CTRL", act.ScrollByLine(-1)),
		bind_if(is_outside_vim, "d", "CTRL", act.ScrollByLine(1)),
		bind_if(is_outside_vim, "b", "CTRL", act.ScrollByPage(-1)),
		bind_if(is_outside_vim, "f", "CTRL", act.ScrollByPage(1)),

		-- Font Size
		-- { key = "-", mods = wez_mod, action = act.DecreaseFontSize },
		-- { key = "=", mods = wez_mod, action = act.IncreaseFontSize },

		-- NOOPs
		{ key = "-", mods = "SUPER", action = act.Nop },
		{ key = "=", mods = "SUPER", action = act.Nop },
	}
	config.mouse_bindings = {
		{ event = { Down = { streak = 1, button = { WheelUp = 1 } } },   action = act.ScrollByLine(-1) },
		{ event = { Down = { streak = 1, button = { WheelDown = 1 } } }, action = act.ScrollByLine(1) },
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "CTRL",
			action = act.ScrollByPage(-1),
		},

		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "CTRL",
			action = act.ScrollByPage(1),
		},
	}
end

return module
