# Bar Widgets

## Into
Bar Widgets is a program to change the status bar of dwm with xsetroot and you can change the bar to suit to your needs !
Bar Widgets does not contains any widgets by default except mpd-status, add shell scripts or executables in the $PATH to display them.

## Change config.h file
The config.h file is located in the include folder, you can add widgets with the pattern provided.
In order to add a widget; you need to fill a string of the command to execute and a update rate of it in seconds without decimals or set it to 0 for no update.
And finally the kill signal to send to update the widget or set it to 0 for no kill signal, details in the Signals section.
The delim variable contains the delimiter to set between widgets or set it to \0 to set nothing.
The CMDLENGTH variable is the number of characters for each widget, set it to the max characters you can encounter in one widget to avoid the program
to truncate the output of a widget or to crash.

## Signals
The Signal number is the number added after SIGTRMIN signal, to send it, if your signal number is 10 the commad is:
```kill -44 $(pidof bar-widgets)```
Just add 34 to your number, it's 44 in this example.

## Makefile Options
Variables EXECNAME and MPDEXECNAME are the name of the output executable.
Variable PREFIX is the path to the base directory where Bar Widgets executable is installed.
Variable STATUSBARSCRIPTSDIR is the directory where mpd-status executable is installed.

## Install & Uninstall
To install Bar Widgets and clean generated executables, execute the command: ```make && make install && make clean``
To uninstall Bar Widgets execute the command: ```make uninstall```
