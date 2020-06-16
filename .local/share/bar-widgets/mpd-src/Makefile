CC:=gcc
CC:=gcc
CFLAGS:=-std=c18 -LMPD -lmpdclient -O2
SRCFILE:=mpdstatus.c
OBJS:=$(SRCFILES:.c:.o)
LDFLAGS:=
EXECNAME:=mpd-status

all: $(EXECNAME)

$(EXECNAME):
	$(CC) $(SRCFILE) $(CFLAGS) $(LDFLAGS) -o $@
	@mv $(EXECNAME) ..
