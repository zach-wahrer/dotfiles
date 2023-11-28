local module = {}

function module.apply_to_wezterm(wezterm)
	local mux = wezterm.mux

	wezterm.on("gui-startup", function(cmd)
		if cmd.args[1] ~= "pde" then
			return
		end

		-- Config
		local config_dir = wezterm.home_dir .. "/.config"
		local tab, config_editor_pane, window = mux.spawn_window({
			cwd = config_dir,
		})
		config_editor_pane:send_text("nvim\n")

		local config_term_pane = config_editor_pane:split({
			direction = "Bottom",
			size = 0.1,
			cwd = config_dir,
		})

		window:active_tab():set_title("Config")

		-- Code
		local code_dir = wezterm.home_dir .. "/go/src"
		local tab, code_editor_pane, window = window:spawn_tab({
			cwd = code_dir,
		})
		code_editor_pane:send_text("nvim\n")

		local code_term_pane = code_editor_pane:split({
			direction = "Bottom",
			size = 0.1,
			cwd = code_dir,
		})

		window:active_tab():set_title("Code")

		-- Terms
		local terms_dir = wezterm.home_dir
		local tab, term_pane, window = window:spawn_tab({
			cwd = terms_dir,
		})
		local term_pane2 = term_pane:split({
			direction = "Bottom",
			size = 0.666,
			cwd = terms_dir,
		})
		term_pane2:split({
			direction = "Bottom",
			size = 0.5,
			cwd = terms_dir,
		})

		window:active_tab():set_title("Terms")

		-- Notes
		local notes_dir = wezterm.home_dir .. "/Brainhole"
		local tab, note_editor_pane, window = window:spawn_tab({
			cwd = notes_dir,
		})
		note_editor_pane:send_text("nvim\n")

		window:active_tab():set_title("Notes")

		-- Switch to Code tab
		for _, tab in ipairs(window:tabs()) do
			if tab:get_title() == "Code" then
				tab:activate()
				break
			end
		end
	end)
end

return module
