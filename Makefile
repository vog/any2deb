VERSION=1.2
PKG=any2deb-$(VERSION)
SRC=any2deb gnuwin32-lib2deb gnuwin32-fetchlibs Makefile

MKDIR=mkdir
CP=cp -a
TAR=tar
INSTALL=install

DESTDIR=/usr/local
BINDIR=$(DESTDIR)/bin

all:

install:
	$(INSTALL) -m 0755 any2deb $(BINDIR)/
	$(INSTALL) -m 0755 gnuwin32-lib2deb $(BINDIR)/

dist: $(PKG).tar.gz

$(PKG).tar.gz: $(SRC)
	$(MKDIR) $(PKG)
	$(CP) $+ $(PKG)/
	$(TAR) -cz -f $@ $(PKG)
	$(RM) -r $(PKG)
