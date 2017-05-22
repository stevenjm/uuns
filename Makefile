CC     ?= cc
CFLAGS ?= -O2
GROUP  ?= uuns
PREFIX ?= /usr/local

all: uuns
.PHONY: all

install: all
	install -s -o root -g $(GROUP) -m 0754 uuns $(PREFIX)/sbin/uuns
	install -o root -g root -m 0644 uuns.8 $(PREFIX)/share/man/uuns.8
	setcap cap_sys_admin,cap_setuid,cap_setgid=pe $(PREFIX)/sbin/uuns
.PHONY: install

uninstall:
	rm -f $(PREFIX)/sbin/uuns $(PREFIX)/share/man/uuns.8
.PHONY: uninstall

uuns: uuns.c
	$(CC) $(CFLAGS) -std=c99 -o uuns uuns.c

README.md: uuns.8
	echo -e '<!-- Automatically generated from uuns.8. -->\n' >README.md
	mandoc -T markdown uuns.8 >>README.md
