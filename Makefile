VERSION=1.2
PKG=any2deb-$(VERSION)
SCRIPTS=any2deb gnuwin32-lib2deb gnuwin32-fetchlibs debuild-cross debuild-cross-prepare
SRC=$(SCRIPTS) Makefile

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

dist: $(PKG).tar.gz

$(PKG).tar.gz: $(SRC)
	$(MKDIR) $(PKG)
	$(CP) $+ $(PKG)/
	$(TAR) -cz -f $@ $(PKG)
	$(RM) -r $(PKG)
