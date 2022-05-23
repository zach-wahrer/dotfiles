#!/bin/bash
# https://github.com/polybar/polybar/issues/763
(
  flock 200

  killall -q polybar
  while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done
  outputs=$(xrandr --query | grep " connected" | cut -d" " -f1)

  {%@@ if profile == "red-wolf" @@%}
  export MONITOR=eDP-1
  export TRAY_POSITION=right
  polybar --reload main </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
  disown

  {%@@ else @@%}
  # for m in $outputs; do
  #   if [[ $m == "DP-2-1" ]]; then
  #       tray_output=$m
  #   fi
  # done
  tray_output=DP-2-1
  for m in $outputs; do
    export MONITOR=$m
    export TRAY_POSITION=none
    if [[ $m == $tray_output ]]; then
      TRAY_POSITION=right
    fi
    polybar --reload main </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- &
    disown
  done
  {%@@ endif @@%}

) 200>/var/tmp/polybar-launch.lock
