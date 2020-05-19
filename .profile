# Profile file. Runs on login. Environmental variables are set here.

export XDG_CONFIG_HOME="$HOME/.config"

# Load aliases
source $XDG_CONFIG_HOME/aliasrc

# Adds servals directories to $PATH
export PATH="$PATH:$(du "/usr/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:$(du "$HOME/.local/bin/statusbar/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
# OS dev stuff
export PATH="$PATH:$(du "$HOME/files/Dev/osdev/i686-elf-4.9.1-Linux-x86_64/bin" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:$(du "$HOME/files/Dev/osdev/x86_64-elf-4.9.1-Linux-x86_64/bin" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"

# ~/ Clean-up:
export LESSHISTFILE="-"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export CALCURSE_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/calcurse"
export ANDROID_SDK_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/AndroidSDK"

# Other program settings:
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export LESS=-R
export LESS_TERMCAP_mb="$(printf '%b' '[1;31m')"
export LESS_TERMCAP_md="$(printf '%b' '[1;36m')"
export LESS_TERMCAP_me="$(printf '%b' '[0m')"
export LESS_TERMCAP_so="$(printf '%b' '[01;44;33m')"
export LESS_TERMCAP_se="$(printf '%b' '[0m')"
export LESS_TERMCAP_us="$(printf '%b' '[1;32m')"
export LESS_TERMCAP_ue="$(printf '%b' '[0m')"
export LOCATION=""

# Shortcuts to my Files
export FR=$HOME/files
export DEV=$HOME/files/Dev
export VIDEOS=$HOME/files/Dev
export MUSIC=$HOME/Music
export PHOTOS=$HOME/Photos

# Start graphical server on tty1 if not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x Xorg >/dev/null && exec startx

sudo -n loadkeys .local/share/ttymaps.kmap 2>/dev/null
