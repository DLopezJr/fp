#!/bin/sh -e
#AUTHOR: David Lopez Jr. /* git(hub|lab).com/dlopezjr */
#PURPOSE: Frontend wrapper for $(flatpak run)

#VARIABLE(S)
app=$(flatpak list --app | cut -f2 | awk -F. -v app="$1" '(tolower($NF) ~ app)')

#FUNCTION(S)
##check if flatpak is installed and accesible to $PATH
test -x "$(command -v flatpak)" || printf "Flatpak package was not found.\n"

##check if app name was entered by user
test -z $1 && flatpak list --app && exit 

##main
test $2 && flatpak run "$app" "$2" && exit
test $1 && flatpak run "$app"
