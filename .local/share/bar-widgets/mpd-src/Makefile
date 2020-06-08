CC:=gcc
CC:=gcc
EXTRAFLAGS:=-fpie -pie -Fpic -fstack-protector-all -D_FORTIFY_SOURCE=2 -Wl,-z,relro,-z,now
CFLAGS:=-std=c99 -LMPD -lmpdclient -Wall -Wextra -Werror -O2 $(EXTRAFLAGS)
SRCFILE:=mpdstatus.c
OBJS:=$(SRCFILES:.c:.o)
LDFLAGS:=
EXECNAME:=mpd-status

all: $(EXECNAME)

$(EXECNAME):
	$(CC) $(SRCFILE) $(CFLAGS) $(LDFLAGS) -o $@
	@mv $(EXECNAME) ..
