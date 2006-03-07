#!/bin/sh

# ensure any2deb is executable
chmod 755 any2deb

# retrieve build command, it's an example of any2deb ;-)
BUILD_CMD=`./any2deb | grep -C1 any2deb.tar`

# build
tar -c -f any2deb.tar any2deb
echo running:
echo "$BUILD_CMD"
echo
eval "$BUILD_CMD"
rm -f any2deb.tar
