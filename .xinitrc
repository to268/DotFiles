#!/bin/sh

# startx config
[ -f ~/.xprofile ] && . ~/.xprofile
exec bspwm
localectl --no-convert set-x11-keymap fr
