# Where the magic happens.
export DOTFILES="${HOME}/.dotfiles"

# Add binaries into the path
export PATH="${DOTFILES}/bin:${PATH}"

# Source all files in "source"
function src() {
  if [[ "$1" ]]; then
    source "$DOTFILES/source/$1.sh"
  else
    for file in $DOTFILES/source/*; do
      source "$file"
    done
  fi
}

# Run dotfiles script, then source.
dotfiles() {
  $DOTFILES/bin/dotfiles "$@" && src
}

src

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
