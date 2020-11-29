# shellcheck shell=bash

[[ "$(hostname)" == "MacBookPro" ]] || return 0

# Cabal
path_add "${HOME}/.cabal/bin"

# Go
export GOPATH="$HOME/Developer/go"
path_add "${GOPATH}/bin"

# Python
path_add "${HOME}/.poetry/bin"
