# ArchLinuxDotFiles
My Arch Linux configuration

## Instalation
You need to install yay in order to install some AUR packages
list is in packges.txt

## Suckless builds
My Suckless custom builds of dwm, dmenu and st are located in .local/share/

dwm patches:
```
systray
fullscreen
attachaside
gridmode
cyclelayouts
mpdcontrol
notitle
rotatestack
setborderpx
three-column
fullgaps
swallow
```

dmenu patches:
```
highpriority
lineheight
numbers
```

st patches:
```
alpha
anysize
blinking cursor
copyurl
externalpipe
externalpipe-eternal
font2
gruvbox
iso14755
newterm
openurl
scrollbar
scrollbar-mouse
sync
vertcenter
Xressources
workingdir
```

bar-widgets is a program to handle the dwm status bar.

## Lightdm (optional)

requied packages :
```
lightdm
lightdm-webkit-theme-aether
lightdm-webkit2-greeter
```

my lightdm.conf :
```
[LightDM]
run-directory=/run/lightdm

[Seat:*]
session-wrapper=/etc/lightdm/Xsession
greeter-setup-script=/usr/bin/numlockx on
greeter-session=lightdm-webkit2-greeter
user-session=bspwm
```
