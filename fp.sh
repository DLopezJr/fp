#!/bin/sh -e
#AUTHOR: David Lopez Jr. /* git(hub|lab).com/dlopezjr */
#PURPOSE: Frontend wrapper for $(flatpak run)

#FUNCTION(S)
##check if flatpak is installed and accesible to $PATH
command -v flatpak || { printf "Flatpak package was not found.\n"; exit 1; }

##check if app name was NOT entered by user
test -z $1 && printf "Enter an app to fp.\n\$ fp <app>\n\nINSTALLED APPS\n$app\n" && exit 1;

#VARIABLE(S)
app=$(flatpak list --app | cut -f2 | awk -F. -v app="$1" '(tolower($NF) ~ tolower(app))')

##remove app name from "$@" array
shift 1;

##main
flatpak run "$app" "$@"
