local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.warn_about_missing_glyphs = false
config.pane_focus_follows_mouse = true
config.enable_wayland = true
config.scrollback_lines = 10000
config.front_end = "OpenGL"

require("theme").apply_to_config(config)
require("mapping").apply_to_config(config)
require("pde").apply_to_wezterm(wezterm)

return config
