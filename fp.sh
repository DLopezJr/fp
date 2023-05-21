#!/bin/sh -e
#AUTHOR: David Lopez Jr. /* git(hub|lab).com/dlopezjr */
#PURPOSE: Frontend wrapper for $(flatpak run)

#VARIABLE(S)
app=$(flatpak list --app | cut -f2 | awk -F. -v app="$1" '(tolower($NF) ~ tolower(app))')

#FUNCTION(S)
##check if flatpak is installed and accesible to $PATH
command -v flatpak >/dev/null 2>&1 || printf "Flatpak package was not found.\n";

##check if no arguements were enetered by user 
test "$#" -eq "0" && printf "Enter an app to fp.\n\$ fp <app>\n\nINSTALLED APPS\n$app\n" && exit 1; 

##remove app name from "$@" array
shift 1;

##main
flatpak run "$app" "$@"
