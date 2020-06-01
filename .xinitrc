#!/bin/sh

# startx config
[ -f ~/.xprofile ] && . ~/.xprofile
exec bspwm
#exec dwm
setxkbmap fr
