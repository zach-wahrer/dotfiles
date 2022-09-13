#!/bin/bash
# https://github.com/polybar/polybar/issues/763
(
  flock 200

  killall -q polybar
  while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done
  outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)
  tray_postion=right

  {%@@ if profile == "red-wolf" @@%}
  MONITOR=HDMI2 TRAY_POSITION=$tray_position polybar --reload main </dev/null >/var/tmp/polybar.log 2>&1 200>&- &
  disown
  {%@@ else @@%}
  if $outputs == "eDP-1"; then
    MONITOR=eDP-1 TRAY_POSITION=$tray_position polybar --reload main </dev/null >/var/tmp/polybar.log 2>&1 200>&- &
    disown
  else
    tray_output=DP-2-1
    for m in $outputs; do
      if [[ $m == $tray_output ]]; then
        MONITOR=$m TRAY_POSITION=$tray_position polybar --reload main </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
      else
        MONITOR=$m TRAY_POSITION=none polybar --reload main </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
      fi
      disown
      done
  fi
  {%@@ endif @@%}
) 200>/var/tmp/polybar-launch.lock
