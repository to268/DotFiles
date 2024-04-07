#!/usr/bin/env bash

dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Dark'
gsettings set org.gnome.desktop.interface icon-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
gsettings set org.gnome.desktop.interface font-name 'IntoneMonoNerdFontPropo'

/usr/lib/xdg-desktop-portal-hyprland &
/usr/lib/xdg-desktop-portal-gtk &
/usr/lib/xdg-desktop-portal &

wificonnect &
wpaperd &
dunst &
mpd &
eww daemon && eww open bar0 &

# Audio
pipewire &
pipewire-pulse &
wireplumber &

# Misc
fcitx5 -d &
