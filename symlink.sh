#!/usr/bin/env bash
#
# Install symlinks in home directory to their corresponding dotfiles here.

# Confirm the user wants to remove all dotfiles in their home directory
printf "This script will permanently delete the following dotfiles from your "
printf "home directory and replace them with symlinks to the corresponding "
printf "files in this directory:"
declare -a files=(".bash_profile"     ".bashrc" ".gemrc" ".gitconfig"
                  ".gitignore_global" ".gitk"   ".npmrc" ".profile" ".railsrc"
                  ".rdebugrc" ".ssh-auto-completion.sh" ".vimrc")
echo
for i in "${files[@]}"
do
  printf "\t%s\n" "$i"
done

read -p "Do you wish to proceed? [y/n] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
  printf "No symlinks created.\n"
  exit 1
fi


dotfiles=$(pwd)
# Symlink dotfiles to home directory
printf "Making Terminal symlinks in %s\n" "$HOME"
cd ~
for i in "${files[@]}"
do
  printf "\tSymlinking %s\n" "$i"
  rm "$i"
  ln -s "$dotfiles/$i" "$i"
done

printf "Finished!\n"
