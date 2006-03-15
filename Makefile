VERSION=1.1
PKG=any2deb-$(VERSION)
SRC=any2deb gnuwin32-lib2deb Makefile

MKDIR=mkdir
CP=cp -a
TAR=tar

all:

dist: $(PKG).tar.gz

$(PKG).tar.gz: $(SRC)
	$(MKDIR) $(PKG)
	$(CP) $+ $(PKG)/
	$(TAR) -cz -f $@ $(PKG)
	$(RM) -r $(PKG)
