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
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':' -)"
export PATH="$PATH:$(du "$HOME/.local/bin/statusbar/" | cut -f2 | paste -sd ':' -)"
# OS dev stuff
#export PATH="$PATH:$(du "$HOME/files/Dev/osdev/i686-elf/bin" | cut -f2 | paste -sd ':' -)"
#export PATH="$PATH:$(du "$HOME/files/Dev/osdev/x86_64-elf/bin" | cut -f2 | paste -sd ':' -)"

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
export GTK_THEME=Arc:dark

# list for lf icons:
export LF_ICONS="di=📁:\
fi=📃:\
tw=🤝:\
ow=📂:\
ln=⛓:\
or=❌:\
ex=🎯:\
*.1=ℹ:\
*.7z=📦:\
*.PKGBUILD=:\
*.R=📊:\
*.Rmd=📊:\
*.S=:\
*.asm=:\
*.avi=🎥:\
*.bash=:\
*.bib=🎓:\
*.bin=:\
*.c=:\
*.cal=:\
*.cpp=:\
*.crt=:\
*.cs=:\
*.csh=:\
*.css=:\
*.css=🎨:\
*.csv=📓:\
*.deb=:\
*.djvu=📚:\
*.dll=:\
*.ebuild=:\
*.elf=:\
*.epub=📚:\
*.exe=:\
*.flac=:\
*.ged=👪:\
*.gif=🖼:\
*.gitignore=:\
*.go=:\
*.gpg=🔒:\
*.h=:\
*.hpp=:\
*.html=:\
*.html=🌎:\
*.ico=🖼:\
*.img=📀:\
*.info=ℹ:\
*.iso=📀:\
*.jar=♨:\
*.java=♨:\
*.java=:\
*.jpeg=📸:\
*.jpg=📸:\
*.js=:\
*.ko=:\
*.ksh=:\
*.log=📙:\
*.lua=:\
*.m4a=🎵:\
*.md=:\
*.md=📘:\
*.me=✍:\
*.mk=:\
*.mkv=🎥:\
*.mom=✍:\
*.mp3=🎵:\
*.mp4=🎥:\
*.mpeg=🎥:\
*.ms=✍:\
*.n64=🎮:\
*.nfo=ℹ:\
*.o=:\
*.ogg=🎵:\
*.opus=🎵:\
*.ovpn=:\
*.part=💔:\
*.pdf=📚:\
*.png=🖼:\
*.py=:\
*.r=📊:\
*.rar=📦:\
*.rb=:\
*.rmd=📊:\
*.rpm=:\
*.rss=:\
*.s=:\
*.sh=:\
*.svg=🗺:\
*.tag=:\
*.tar.gz=📦:\
*.tar.xz=📦:\
*.tar.zst=📦:\
*.tex=📜:\
*.torrent=🔽:\
*.ts=ﯤ:\
*.txt=✍:\
*.v64=🎮:\
*.v=:\
*.vcf=👪:\
*.vim=:\
*.webm=🎥:\
*.xcf=🖌:\
*.xlsx=📓:\
*.xml=📰:\
*.z64=🎮:\
*.zip=📦:\
*.zsh=:\
*.zshrc=:\
*.zypper=:\
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
