## Lightdm Version

Lightdm packages :
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
user-session=dwm
```

## Additional Informations
Change some lines in theses files:
.config/sxhkd/sxhkdrc
.local/bin/dmenushutdown
