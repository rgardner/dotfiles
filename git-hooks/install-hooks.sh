#!/usr/bin/env bash
#
# Install git hooks into `.git/hooks/`

DOTGIT=$(git rev-parse --git-dir)
TOPLEVEL=$(git rev-parse --show-toplevel)
TO=${DOTGIT}/hooks
FROM=${TOPLEVEL}/git-hooks

ln -sf "${FROM}"/post-checkout "${TO}"/post-checkout
ln -sf "${FROM}"/post-merge "${TO}"/post-merge
