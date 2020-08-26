# Notify Manager

## Into
Notify Manager is a program to display notification each x seconds or by sending the appropriate signal.
To customize Notify Manager, you need to change the config.h file and reinstall it;

## Change config.h file
The config.h file is located in the include folder, you can add a notif (notification) with the pattern provided.
In order to add a notif; you need to provide arguments for all options but you can set Icon Path to NULL, Display Frequency or Signal to 0 when you don't use them.
The kill signal to send to update a notif or set it to 0 for no kill signal, details in the Signals section.
The Content Path is the path of the command to fill the content with the output of the script, the Icon path is the path to the icon to show or NULL for no icon.
The Severity can be NOTIFY_URGENCY_LOW for a low severity NOTIFY_URGENCY_NORMAL for a normal severity or NOTIFY_URGENCY_CRITICAL for a critical severity.

## Signals
The Signal number is the number added after SIGTRMIN signal, to send it, if your signal number is 10 the command is:
```kill -44 $(pidof notify-manager)```
Just add 34 to your number, it's 44 in this example.
If you sending a Signal other than SIGINIT, SIGTERM or others signals set into config.h, the program will crash.

## Makefile Options
Variable EXECNAME is the name of the output executable.
Variable PREFIX is the path to the base directory where Notify Manager executable is installed.

## Install & Uninstall
To install Notify Manager and clean generated executables, execute the command without sudo: ```make && make install && make clean``
To uninstall Notify Manager execute the command without sudo: ```make uninstall```
