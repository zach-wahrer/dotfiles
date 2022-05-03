!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}


run /home/zach/.screenlayout/layout.sh
run compton
run nm-applet
run lxsettings-daemon
run xfce4-power-manager-settings --restore
