CC:=gcc
SRCFILES:=$(wildcard src/*.c)
INCLUDEDIR:=include/
MPDCFLAGS:=-std=c18 -O2 -LMPD -lmpdclient
CFLAGS:=-O2 -lX11
LDFLAGS:=-I $(INCLUDEDIR)
PREFIX:=~/.local/bin/
STATUSBARSCRIPTSDIR:=$(PREFIX)statusbar/
EXECNAME:=bar-widgets
MPDEXECNAME:=mpd-status
MPDMAKE:=mpd-src/

all: summary $(MPDEXECNAME) $(EXECNAME)

summary:
	@echo "build options for $(EXECNAME) and $(MPDEXECNAME):"
	@echo "CFLAGS:$(CFLAGS) $(MPDCFLAGS)"
	@echo "LDFLAGS:$(LDFLAGS)"

$(MPDEXECNAME):
	@(cd $(MPDMAKE) && $(MAKE))

$(EXECNAME):
	$(CC) $(CFLAGS) $(LDFLAGS) $(SRCFILES) -o $(EXECNAME)

install:
	cp -f $(EXECNAME) $(PREFIX)
	cp -f $(MPDEXECNAME) $(STATUSBARSCRIPTSDIR)

uninstall:
	rm -f $(PREFIX)$(EXECNAME)
	rm -f $(STATUSBARSCRIPTSDIR)$(MPDEXECNAME)

clean:
	rm -f $(MPDEXECNAME) $(EXECNAME)

.PHONY: summary install uninstall clean
