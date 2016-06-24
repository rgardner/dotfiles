# macos-only stuff. Abort if not macos.
is_macos || return 1

# APPLE, Y U PUT /usr/bin B4 /usr/local/bin?!
export PATH="/usr/local/bin:$(path_remove /usr/local/bin)"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

# Make 'less' more.
[[ "$(type -P lesspipe.sh)" ]] && eval "$(lesspipe.sh)"

# Start ScreenSaver. This will lock the screen if locking is enabled.
alias ss="open /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app"

# Functions
clearOpenWithMenu() {
  /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
}

# Change directory to the current Finder directory.
cdf() {
  target=$(osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)')
  if [[ "$target" ]]; then
    cd "$target"; pwd
  else
    echo 'No Finder window found' >&2
  fi
}
