CC     ?= cc
CFLAGS ?= -O2
GROUP  ?= uuns
PREFIX ?= /usr/local

all: uuns
.PHONY: all

install: all
	install -s -o root -g $(GROUP) -m 0754 uuns $(PREFIX)/sbin/uuns
	install -o root -g root -m 0644 uuns.1 $(PREFIX)/share/man/uuns.1
	setcap cap_sys_admin,cap_setuid,cap_setgid=pe $(PREFIX)/sbin/uuns
.PHONY: install

uninstall:
	rm -f $(PREFIX)/sbin/uuns $(PREFIX)/share/man/uuns.1
.PHONY: uninstall

uuns: uuns.c
	$(CC) $(CFLAGS) -std=c99 -o uuns uuns.c

README.md: uuns.1
	echo -e '<!-- Automatically generated from uuns.1. -->\n' >README.md
	mandoc -T markdown uuns.1 >>README.md
