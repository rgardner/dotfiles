# shellcheck shell=bash

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Prevent less from clearing the screen while still showing colors.
export LESS=-XR

# Set the terminal's title bar.
function titlebar() {
  echo -n $'\e]0;'"$*"$'\a'
}

# Coloring
export CLICOLOR=1

# Enabling 256 colors
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

alias dotf="cd $DOTFILES"

export PATH="$HOME/.dotfiles/bin:$(path_remove "$HOME/.dotfiles/bin")"
[[ -d ~/bin ]] && export PATH=$HOME/bin:$PATH


# Date helper expansion.
export TODAY=$(date "+%y-%m-%d")
