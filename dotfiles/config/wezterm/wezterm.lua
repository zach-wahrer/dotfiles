local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.warn_about_missing_glyphs = false
config.pane_focus_follows_mouse = true

{%@@ if profile == "neto-wolf" or profile == "vm" @@%}
config.enable_wayland = false
config.front_end = "OpenGL"
-- config.front_end = "Software"
{%@@ else @@%}
config.front_end = "WebGpu" -- Seems to have a glitch where the screen doesn't update when it is fullscreen.
{%@@ endif @@%}

config.scrollback_lines = 10000

require("theme").apply_to_config(config)
require("mapping").apply_to_config(config)
require("pde").apply_to_wezterm(wezterm)

return config
