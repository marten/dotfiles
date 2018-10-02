#!/usr/bin/env bash

xscreensaver -no-splash &
setxkbmap -option caps:super
setxkbmap -option compose:menu

workrave &

eval $(gnome-keyring-daemon --start)

gnome-terminal &

exec dbus-launch awesome