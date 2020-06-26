#!/bin/sh

# startx config
[ -f ~/.xprofile ] && . ~/.xprofile
ssh-agent dwm # exec dwm
# Load ssh-keys
ssh-add
