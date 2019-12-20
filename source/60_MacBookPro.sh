#!/usr/bin/env bash

is_macos || return 1

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

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Autojump support.
[[ -s "$(brew --prefix)"/etc/autojump.sh ]] && . "$(brew --prefix)"/etc/autojump.sh

# Direnv
# Put after rvm, git-prompt, and other shell extensions have been loaded
eval "$(direnv hook bash)"

# Bash completion.
brew_prefix="$(brew --prefix)"
[[ -r "${brew_prefix}/etc/profile.d/bash_completion.sh" ]] && . "${brew_prefix}/etc/profile.d/bash_completion.sh"

if [ -d "${brew_prefix}/etc/bash_completion.d" ]; then
  for f in "${brew_prefix}"/etc/bash_completion.d/*; do
    . "$f"
  done
fi

# FZF
# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hiden --follow --glob "!.git/*"'

# Aliases
alias hubb='hub browse'
alias aptvpn='cd /usr/local/etc/openvpn && sudo openvpn --config client2.conf'
