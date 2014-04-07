#!/usr/bin/env bash

dotfiles=$(pwd)
# Symlink dotfiles to home directory
printf "Making Terminal symlinks...\n"
cd ~; rm .bash_profile; ln -s $dotfiles/.bash_profile .bash_profile
cd ~; rm .bashrc;       ln -s $dotfiles/.bashrc       .bashrc
cd ~; rm .gemrc;        ln -s $dotfiles/.gemrc        .gemrc
cd ~; rm .gitconfig;    ln -s $dotfiles/.gitconfig    .gitconfig
cd ~; rm .gitignore_global; ln -s $dotfiles/.gitignore_global .gitignore_global
cd ~; rm .gitk;         ln -s $dotfiles/.gitk         .gitk
cd ~; rm .npmrc;        ln -s $dotfiles/.npmrc        .npmrc
cd ~; rm .railsrc;      ln -s $dotfiles/.railsrc      .railsrc
cd ~; rm .redebugrc;    ln -s $dotfiles/.redebugrc    .redebugrc
cd ~; rm .vimrc;        ln -s $dotfiles/.vimrc        .vimrc

printf "\nFinished!\n"
read -p "Press any key to exit."
