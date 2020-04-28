# ArchLinuxDotFiles
My Arch Linux configuration

# Instalation
You need to install yay in order to install some AUR packages
list is in packges.txt

# Lightdm (optional)

requied packages :
```
lightdm
lightdm-webkit-theme-aether
lightdm-webkit2-greeter
```

my lightdm.conf :
```
[LightDM]
#log-directory=/var/log/lightdm
run-directory=/run/lightdm

[Seat:*]
session-wrapper=/etc/lightdm/Xsession
greeter-setup-script=/usr/bin/numlockx on
greeter-session=lightdm-webkit2-greeter
user-session=bspwm

# XDMCP Server configuration

[XDMCPServer]
#enabled=false
#port=177
#listen-address=
#key=
#hostname=

# VNC Server configuration

[VNCServer]
#enabled=false
#command=Xvnc
#port=5900
#listen-address=
#width=1024
#height=768
#depth=8

```
