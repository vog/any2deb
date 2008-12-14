VERSION=1.2
PKG=any2deb-$(VERSION)
SCRIPTS=any2deb gnuwin32-lib2deb gnuwin32-fetchlibs debuild-cross debuild-cross-prepare
DOCS=README
EXTRA=Makefile

MKDIR=mkdir
CP=cp -a
TAR=tar
INSTALL=install

DESTDIR=/usr/local
BINDIR=$(DESTDIR)/bin

all:

install:
	for file in $(SCRIPTS); do \
	    $(INSTALL) -m 0755 $$file $(BINDIR)/ ; done

dist: any2deb-$(VERSION).tar.gz any2deb_$(VERSION)-2_all.deb

any2deb-%.tar.gz: $(SCRIPTS) $(DOCS) $(EXTRA)
	$(RM) -r any2deb-$*
	$(MKDIR) any2deb-$*
	$(CP) $+ any2deb-$*/
	$(TAR) -cz -f $@ any2deb-$*
	$(RM) -r any2deb-$*

any2deb_%-2_all.deb: $(SCRIPTS) $(DOCS) $(EXTRA)
	$(RM) -r usr
	$(MKDIR) -p usr/bin
	$(CP) $(SCRIPTS) usr/bin/
	$(MKDIR) -p usr/share/doc/any2deb
	$(CP) $(DOCS) usr/share/doc/any2deb/
	$(TAR) -cz -f $@-contents.tar.gz usr
	$(RM) -r usr
	./any2deb any2deb $* $@-contents.tar.gz /
	$(RM) $@-contents.tar.gz
