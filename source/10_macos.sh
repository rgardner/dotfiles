# shellcheck shell=bash

# macOS-only stuff. Abort if not macOS.
is_macos || return 0

# APPLE, Y U PUT /usr/bin B4 /usr/local/bin?!
export PATH="/usr/local/bin:$(path_remove /usr/local/bin)"

# Trim new lines and copy to clipboard
alias c="tr -d '\n' | pbcopy"

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
    cd "$target" || return
    pwd
  else
    echo 'No Finder window found' >&2
  fi
}

# Completions

# Git completions
. "$(brew --prefix)/git/contrib/completion/git-prompt.sh"

# Homebrew completions
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-bash
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

# Autojump support
[[ -s "$(brew --prefix)"/etc/autojump.sh ]] && . "$(brew --prefix)"/etc/autojump.sh

# Make 'less' more
[[ "$(type -P lesspipe.sh)" ]] && eval "$(lesspipe.sh)"
