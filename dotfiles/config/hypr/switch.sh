#!/usr/bin/env bash

if grep open /proc/acpi/button/lid/LID0/state; then
	{%@@ if profile == "red-wolf" @@%}
	hyprctl keyword monitor "eDP-1, 1920x1080@60.029999, 0x0, 1.5"
	{%@@ endif @@%}
else
	if [[ $(hyprctl monitors | grep "Monitor" | wc -l) != 1 ]]; then
		hyprctl keyword monitor "eDP-1, disable"
	fi
fi
