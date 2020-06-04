#!/bin/sh

# startx config
[ -f ~/.xprofile ] && . ~/.xprofile
exec bspwm
#ssh-agent dwm # exec dwm with ssh-agent
setxkbmap fr
