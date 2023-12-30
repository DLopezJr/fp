function fp() {
#PURPOSE: Wrapper for $(flatpak run)

##check if flatpak is installed and accesible to $PATH
command -v flatpak >/dev/null 2>&1 || { printf "Flatpak package was not found.\n"; exit 1; }

##check if any flatpak packages are installed
test "$(flatpak list --all | head -c1 | wc -c)" -eq "0" && { printf "No Flatpak packages are installed.\n"; exit 1; }

##check if an app name was entered
[ "$#" -eq "0" ] && { printf "%s\n\n%s\n%s\n%s" "Usage: fp [APP] [OPTION]" "INSTALLED APPS:" "$(flatpak list --all)"; exit 1; }

##store reverse dns name for package
app=$(flatpak list --app | cut -f2 | awk -F. -v app="$1" '(tolower($0) ~ tolower(app))')

##check if entered app name is valid
[ -z "$app" ] && { printf "Entered app name is invalid.\n"; exit 1; }

##remove app name from "$@" array
shift 1;

##main
flatpak run "$app" "$@"
}
# Tab completion for Flatpak applications
function _fp_completion() {
  local applications
  applications=($(flatpak list --app | awk -F '\t' '{print $2}'))
  _arguments '1: :("${applications[@]}")'
}

compdef _fp_completion fp
