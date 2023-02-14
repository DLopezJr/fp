.POSIX:
#AUTHOR: David Lopez Jr. /* dlopez@bmtdps.com && git(hub|lab).com/dlopezjr */

#VARIABLES
PREFIX = /usr/local

#TARGETS
install:
  cp    fp.sh $(PREFIX)/fp
  chmod 755   $(PREFIX)/fp
  
uninstall:
  rm $(PREFIX)/bin/fp
