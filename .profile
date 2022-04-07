#!/bin/sh

# Profile file. Runs on login. Environmental variables are set here.

# Common Paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Load aliases
source $XDG_CONFIG_HOME/aliasrc

# Adds servals directories to $PATH
export PATH="$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}"
export PATH="$PATH:${$(find ~/.local/bin/statusbar -type d -printf %p:)%%:}"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"

# ~/ Clean-up:
export LESSHISTFILE="-"
export AlSA_CONFIG_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/alsa/asoundrc"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export CALCURSE_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/calcurse"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/AndroidSDK"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/winepfx/default"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export PASSWORD_STORE_CLIP_TIME=10
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export TMUX_TMPDIR="$XDG_CACHE_HOME"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"

# Other program settings:
export LESS=-R
export QT_QPA_PLATFORMTHEME="gtk2"      # Use gtk2 theme on QT
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm
export LOCATION=""
export GTK_THEME=Ant:Dark
export MAKEFLAGS=-j$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 1)

if pacman -Qs libxft-bgra >/dev/null 2>&1; then
	# Start graphical server on tty1 if not already running.
	[ "$(tty)" = "/dev/tty1" ] && ! pidof Xorg >/dev/null 2>&1  && exec startx
else
    echo "You need to install libxft-bgra to avoid a crash !"
fi

# Load ssh-keys
eval `ssh-agent` >/dev/null
ssh-add -q
