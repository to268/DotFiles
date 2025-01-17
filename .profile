#!/bin/sh

# Profile file. Runs on login. Environmental variables are set here.

# Common Paths
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Load aliases
source $XDG_CONFIG_HOME/aliasrc

# Adds servals directories to $PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/statusbar:$PATH"

# Servals local programs
export PATH=/usr/local/llvm/bin:$PATH
#export PATH=/usr/local/llvm-dev/bin:$PATH

# Default programs:
export EDITOR="nvim"
export TERMINAL="foot"
export BROWSER="firefox"
export READER="zathura"

# ~/ Clean-up:
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export CALCURSE_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/calcurse"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/AndroidSDK"
export DOCKER_CONFIG="${XDG_CONFIG_HOME:-$HOME/.config}/docker"
export GNUPGHOME="${XDG_DATA_HOME:-$HOME/.local/share}/gnupg"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/winepfx/default"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/password-store"
export PASSWORD_STORE_CLIP_TIME=10
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"
export TMUX_TMPDIR="$XDG_CACHE_HOME"
export PSQL_HISTORY="$XDG_CACHE_HOME/psql_history"
export PYTHON_HISTORY="$XDG_CACHE_HOME/python_history"
export GDBHISTFILE="$XDG_CACHE_HOME/gdb_history"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"
export PIPX_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/pipx"
export OPAMROOT="${XDG_DATA_HOME:-$HOME/.local/share}/opam"
export PIPX_BIN_DIR="$HOME/.local/bin/pipx"
export PICO_SDK_PATH="$HOME/files/Dev/pico/pico-sdk"
export PICOTOOL_FETCH_FROM_GIT_PATH="$HOME/files/Dev/pico/picotool"
export MOZBUILD_STATE_PATH="${XDG_DATA_HOME:-$HOME/.local/share}/mozbuild"
export ELECTRUMDIR="${XDG_DATA_HOME:-$HOME/.local/share}/electrum"
export DEBUGINFOD_URLS="https://debuginfod.artixlinux.org"

# Other program settings:
export LESS=-R
export LOCATION=""
export MAKEFLAGS=-j$(nproc 2>/dev/null || sysctl -n hw.ncpu 2>/dev/null || echo 1)

[ "$(tty)" = "/dev/tty1" ] && ! pidof Hyprland >/dev/null 2>&1  && exec dbus-launch Hyprland

# Load ssh-keys
eval `ssh-agent` > /dev/null
for i in ~/.ssh/*.pub; do
    ssh-add -q ${i%.*}
done
