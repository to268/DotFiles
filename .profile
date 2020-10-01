#!/bin/sh

# Profile file. Runs on login. Environmental variables are set here.

# Common Paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# Load aliases
source $XDG_CONFIG_HOME/aliasrc
# Load shortcuts
source $XDG_CONFIG_HOME/shortcuts
# Load directories
source $XDG_CONFIG_HOME/directories
# Load Files env vars
source $XDG_CONFIG_HOME/files

# Adds servals directories to $PATH
export PATH="$PATH:$(du "/usr/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
export PATH="$PATH:$(du "$HOME/.local/bin/statusbar/" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
# OS dev stuff
#export PATH="$PATH:$(du "$HOME/files/Dev/osdev/i686-elf-10.1.0-Linux-x86_64/bin" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"
#export PATH="$PATH:$(du "$HOME/files/Dev/osdev/x86_64-elf-10.1.0-Linux-x86_64/bin" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

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
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export WINEPREFIX="${XDG_DATA_HOME:-$HOME/.local/share}/winepfx/default"
export TMUX_TMPDIR="$XDG_CACHE_HOME"
export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"

# Other program settings:
export LESS=-R
export _JAVA_AWT_WM_NONREPARENTING=1	# Fix for Java applications in dwm
export LOCATION=""
export GTK_THEME=Adwaita:dark

# list for lf icons:
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.txt=✍:\
*.mom=✍:\
*.me=✍:\
*.ms=✍:\
*.png=🖼:\
*.ico=🖼:\
*.jpg=📸:\
*.jpeg=📸:\
*.gif=🖼:\
*.svg=🗺:\
*.xcf=🖌:\
*.html=🌎:\
*.xml=📰:\
*.gpg=🔒:\
*.css=🎨:\
*.pdf=📚:\
*.djvu=📚:\
*.epub=📚:\
*.csv=📓:\
*.xlsx=📓:\
*.tex=📜:\
*.md=📘:\
*.r=📊:\
*.R=📊:\
*.rmd=📊:\
*.Rmd=📊:\
*.mp3=🎵:\
*.opus=🎵:\
*.ogg=🎵:\
*.m4a=🎵:\
*.flac=🎼:\
*.mkv=🎥:\
*.mp4=🎥:\
*.webm=🎥:\
*.mpeg=🎥:\
*.avi=🎥:\
*.zip=📦:\
*.rar=📦:\
*.7z=📦:\
*.tar.gz=📦:\
*.z64=🎮:\
*.v64=🎮:\
*.n64=🎮:\
*.1=ℹ:\
*.nfo=ℹ:\
*.info=ℹ:\
*.log=📙:\
*.iso=📀:\
*.img=📀:\
*.bib=🎓:\
*.ged=👪:\
*.vcf=👪:\
*.part=💔:\
*.torrent=🔽:\
"

if pacman -Qs libxft-bgra >/dev/null 2>&1; then
	# Start graphical server on tty1 if not already running.
	[ "$(tty)" = "/dev/tty1" ] && ! pidof Xorg >/dev/null 2>&1  && exec startx
else
    echo "You need to install libxft-bgra to avoid a crash !"
fi

# Load ssh-keys
eval `ssh-agent` >/dev/null
ssh-add -q
