#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:scroll"
run gtk-launch org.telegram.desktop._0e3b31af9e9125b2a67a2550de040f94.desktop
