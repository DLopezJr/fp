#!/bin/sh -e
#PURPOSE: Uninstaller for fp

if command -v fp 1> /dev/null; then {
	fp_path=$(command -v fp);
	case $fp_path in
		/home/$USER/*/fp)
			rm "$fp_path";
			;;
		*) 
			if [ "$(id -u)" -eq 0 ]; then
				rm "$fp_path";
			else {
				printf 'ERROR: Must be root.';
				exit 1;
			} fi
			;;
	esac
} else {
	printf 'ERROR: fp was not found in PATH.\n';
	exit 1; 
} fi
