#!/bin/sh -e
#PURPOSE: Wrapper for $(flatpak run)

main() 
{ app="$1"; # int
	##check if flatpak is installed and accesible to $PATH
	if ! command -v flatpak 1> /dev/null 2> /dev/null; then {
		printf "ERROR: The 'flatpak' package was not found.\n" >&2; 
		exit 1; 
	} fi
	
	##check if any flatpak packages are installed
	### For effiency, this checks for 1 char, rather than lines
	bool_flatpak_pkgs=$(flatpak list --app | head -c1 | wc -c);
	if [ "$bool_flatpak_pkgs" -eq "0" ]; then { 
		printf "ERROR: No Flatpak packages are installed.\n" >&2;
		exit 1; 
	} fi
	
	##check if an app name was entered
	if [ "$#" -eq "0" ]; then { 
		printf '%s\n\n%s\n' 'Usage: fp [APP] [OPTION]' '[INSTALLED APPS]' >&2;
		flatpak list --app >&2
		exit 1; 
	} fi
	
	##store reverse dns name for app
	str_app=$(flatpak list --app | cut -f2 | awk -F. -v app="$app" '(tolower($0) ~ tolower(app)) { print($0); }')
	int_app_len=$(printf '%s\n' "$str_app" | wc -l);
	
	##check if entered app name is valid
	if [ -z "$str_app" ]; then { 
		printf "ERROR: Entered app name is invalid.\n" >&2; 
		exit 1; 
	} fi
	
	##check if more than one match occured
	if [ "$int_app_len" -ne 1 ]; then {
		cat <<- EOF >&2
		ERROR: Input was not specfic enough. Try again.
		
		[MATCHED RESULTS]
		$str_app 
		EOF
		exit 1;
	} fi
	
	##remove app name from "$@" array
	shift 1;
	
	flatpak run "$str_app" "$@";
}; main "$@"
