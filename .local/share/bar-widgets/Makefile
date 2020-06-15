CC:=gcc
SRCFILES:=$(wildcard src/*.c)
INCLUDEDIR:=include/
MPDCFLAGS:=-LMPD -lmpdclient
EXTRAFLAGS:=-fpie -pie -Fpic -fstack-protector-all -D_FORTIFY_SOURCE=2 -Wl,-z,relro,-z,now
CFLAGS:=-std=c99 -O2 -D_POSIX_C_SOURCE
LDFLAGS:=-I $(INCLUDEDIR)
PREFIX:=.local/bin/statusbar/
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


uninstall:


clean:
	rm -f $(MPDEXECNAME) $(EXECNAME)

.PHONY: summary install uninstall clean
