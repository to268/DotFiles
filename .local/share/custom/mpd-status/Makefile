CC:=gcc
CFLAGS:=-std=c18 -LMPD -lmpdclient -O2
SRCFILE:=mpdstatus.c
OBJS:=$(SRCFILES:.c:.o)
LDFLAGS:=
PREFIX:=~/.local/bin/
EXECNAME:=mpd-status

all: $(EXECNAME)

$(EXECNAME):
	$(CC) $(SRCFILE) $(CFLAGS) $(LDFLAGS) -o $@

install:
	cp -f $(EXECNAME) $(PREFIX)

uninstall:
	rm -f $(PREFIX)$(EXECNAME)

clean:
	rm -f $(EXECNAME)

.PHONY: install uninstall clean
