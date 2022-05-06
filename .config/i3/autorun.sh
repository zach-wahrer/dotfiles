#!/usr/bin/bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}


run /home/zach/.screenlayout/layout.sh
run compton --backend glx --vsync opengl -b
# run lxsettings-daemon
# run xfce4-power-manager-settings --restore
