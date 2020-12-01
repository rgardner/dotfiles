# shellcheck shell=bash

export DOTFILES="${HOME}/.dotfiles"

# OS detection

is_macos() {
  [[ "$OSTYPE" =~ ^darwin ]] || return 1
}
is_ubuntu() {
  [[ "$(cat /etc/issue 2> /dev/null)" =~ Ubuntu ]] || return 1
}
is_debian() {
  [[ "$(cat /etc/issue 2> /dev/null)" =~ Debian ]] || return 1
}
get_os() {
  for os in macos ubuntu debian; do
    "is_$os"; [[ $? == "${1:-0}" ]] && echo $os
  done
}

# Path manipulation

# Insert "$1" at front of path
# Based on https://superuser.com/a/39995/1089288
path_add() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="$1:${PATH:+"$PATH"}"
  fi
}

# Remove an entry from $PATH
# Based on http://stackoverflow.com/a/2108540/142339
path_remove() {
  local arg path
  path=":$PATH:"
  for arg in "$@"; do
    path="${path//:$arg:/:}"
  done
  path="${path%:}"
  path="${path#:}"
  echo "$path"
}
