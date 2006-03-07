#!/bin/sh

chmod 755 any2deb

VERSION=`./any2deb | grep "any2deb" | head -1 | cut -d- -f2`
VERSION=`echo $VERSION`

tar -cv -f any2deb.tar any2deb
./any2deb \
    any2deb \
    "$VERSION" \
    any2deb.tar \
    /usr/bin \
    "--to-deb --to-rpm"
rm -f any2deb.tar
