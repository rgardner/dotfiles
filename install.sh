#!/usr/bin/env bash

# Bob Gardner's Install Script
cd ~

# Download git completion scripts
printf "git\n"
printf "Download git-completion and git-prompt to home directory\n"
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash .git-completion.bash
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh .git-prompt.sh

# Install vim plugins and colors
printf "vim\n"
printf "Download pathogen and gitgutter"
mkdir -p ~/.vim/autload ~/.vim/bundle ~/.vim/colors

curl -Sso autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd bundle/
git clone git://github.com/airblade/vim-gitgutter.git
cd ..

printf "Download desert256 from %s into ~/.vim/colors/ directory\n" \
       "http://www.vim.org/scripts/script.php?script_id=1243"

printf "Run symlink.sh to replace specified symlinks"
./symlink.sh
