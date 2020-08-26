CC:=gcc
SRCFILES:=$(wildcard src/*.c)
INCLUDEDIR:=include/
CFLAGS:=-O2 -I $(INCLUDEDIR) $(shell pkg-config --cflags --libs libnotify)
PREFIX:=~/.local/bin/
STATUSBARSCRIPTSDIR:=$(PREFIX)statusbar/
EXECNAME:=notify-manager

all: summary $(MPDEXECNAME) $(EXECNAME)

summary:
	@echo "build options for $(EXECNAME):"
	@echo "CFLAGS:$(CFLAGS)"

$(EXECNAME):
	$(CC) $(CFLAGS) $(SRCFILES) -o $(EXECNAME)

install:
	cp -f $(EXECNAME) $(PREFIX)

uninstall:
	rm -f $(PREFIX)$(EXECNAME)

clean:
	rm -f $(EXECNAME)

.PHONY: summary install uninstall clean
