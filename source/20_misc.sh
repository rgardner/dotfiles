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

# Dotfiles
alias dotf="cd $DOTFILES"
export PATH="$HOME/.dotfiles/bin:$(path_remove "$HOME/.dotfiles/bin")"
path_add "${HOME}/bin"

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Python
path_add "${HOME}/.pyenv/bin"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Rust
export CARGO_HOME="${CARGO_HOME:-${HOME}/.cargo}"
path_add "${CARGO_HOME}/bin"

# FZF
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hiden --follow --glob "!.git/*"'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
