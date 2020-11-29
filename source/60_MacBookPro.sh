# shellcheck shell=bash

[[ "$(hostname)" == "MacBookPro" ]] || return 0

# Postgres
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin"

# Cabal
export PATH="$HOME/.cabal/bin:$PATH"

# NVIDIA CUDA
export PATH="/Developer/NVIDIA/CUDA-6.0/bin:$PATH"
export DYLD_LIBRARY_PATH="/Developer/NVIDIA/CUDA-6.0/lib:$DYLD_LIBRARY_PATH"

# Go
export GOPATH="$HOME/Developer/go"
export PATH="$GOPATH/bin:$PATH"

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Python
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="$HOME/.poetry/bin:$PATH"

# Autojump support.
[[ -s "$(brew --prefix)"/etc/autojump.sh ]] && . "$(brew --prefix)"/etc/autojump.sh

# Direnv
# Put after rvm, git-prompt, and other shell extensions have been loaded
eval "$(direnv hook bash)"

# Bash completion.
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

# FZF
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hiden --follow --glob "!.git/*"'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Aliases
alias hubb='hub browse'
alias aptvpn='cd /usr/local/etc/openvpn && sudo openvpn --config client2.conf'
