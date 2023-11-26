#!/bin/sh -e
#PURPOSE: Installer for fp

if [ $(id -u) -eq 0 ]; then {
	PREFIX="/usr/local/bin";
	cp    fp.sh "$PREFIX/fp";
	chmod 755   "$PREFIX/fp";
} else {
	XDG_BIN_HOME="$HOME/.local/bin";
	mkdir -p    "$XDG_BIN_HOME";
	cp    fp.sh "$XDG_BIN_HOME/fp";
	chmod 755   "$XDG_BIN_HOME/fp";
} fi
