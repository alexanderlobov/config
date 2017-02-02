#!/bin/bash

# Load resources

xrdb -merge .Xresources

trayer --edge top --align right --SetDockType true --SetPartialStrut true \
 --expand true --width 10 --transparent true --tint 0x191970 --height 12 &

xsetroot -solid midnightblue

xscreensaver -no-splash &
yandex-disk start

if [ -x /usr/bin/nm-applet ] ; then
    nm-applet &
fi

setxkbmap -option "ctrl:nocaps"
setxkbmap -layout "us,ru" -option "grp:lalt_lshift_toggle,grp_led:caps"
setxkbmap -option "terminate:ctrl_alt_bksp"

exec xmonad
