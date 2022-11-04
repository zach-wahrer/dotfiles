#!/bin/bash
{%@@ if profile == "foundant-wolf" @@%}
outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)
if [[ $outputs == "eDP-1" ]]; then
	xrandr --output eDP-1 --primary --mode 1920x1200 --pos 0x0 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off
else
	xrandr --output eDP-1 --mode 1920x1200 --pos 0x1080 --rotate normal --output DP-1 --off --output DP-2 --off --output DP-3 --off --output DP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1-2 --mode 1920x1080 --pos 1920x497 --rotate normal --output DP-1-3 --off
fi
{%@@ elif profile == "red-wolf" @@%}
	xrandr --output eDP-1 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output HDMI-2 --primary --mode 1920x1080 --pos 0x0 --rotate normal
{%@@ endif @@%}
