#!/usr/bin/env bash

# Confirm the user wants to remove all dotfiles in their home directory
printf "This script will permanently delete the following dotfiles from your "
printf "home directory and replace them with symlinks to the corresponding "
printf "files in this directory:"
declare -a files=(".bash_profile" ".bashrc" ".gemrc" ".gitconfig"
                  ".gitignore_global" ".gitk" ".npmrc" ".railsrc" ".redebugrc"
                  ".vim/" ".vimrc")
echo
for i in "${files[@]}"
do
  echo "  $i"
done

read -p "Are you sure? " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  exit 1
fi


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
cd ~; rm -rf .vim/;     ln -s $dotfiles/.vim/         .vim/
cd ~; rm .vimrc;        ln -s $dotfiles/.vimrc        .vimrc

printf "\nFinished!\n"
