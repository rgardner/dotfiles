# Bob Gardner's Dotfiles

This project contains my config files for the various programming languages and
tools that I use. I am publishing them here to help others improve their
workflow. Where possible, I document the configuration settings to make them
easier to adapt for your own purposes. When I was first starting out, I always
appreciated well documented dotfiles. Better settings make me a more efficient
programmer - and a happier one too.

## Installation

```sh
git clone https://github.com/rgardner/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./bootstrap
```

## Usage

```sh
$ dotfiles --help
usage: dotfiles [-h] {stow,unstow} ...

Manages config files. Provisions machine via Ansible by default.

positional arguments:
  {stow,unstow}
    stow         links package config files to home dir
    unstow       removes package config file links in home dir

optional arguments:
  -h, --help     show this help message and exit
```

Run `just setup` and `just lint` to set up the environment and check for
linting errors.

## What are Dotfiles?

Dotfiles store the settings and configurations of command line utilities and
more.

[Per Wikipedia:](http://en.wikipedia.org/wiki/Dotfile)

> In computing, a hidden directory or hidden file is a directory (folder) or
> file which file system utilities do not display by default. They are commonly
> used for storing user preferences or preserving the state of a utility and
> are frequently created implicitly by using various utilities. Usually the
> intent is to not "clutter" the display of the contents of a directory with
> files the user did not create.

## Viewing dotfiles

Dotfiles are also known as hidden files because they are usually hidden from
file browsers by default. Note that many text editors show hidden files when
viewing directories.

### UNIX Command Line (macOS and Linux)

`ls -a`

### macOS Finder

To view hidden files in Finder, enter the following command in the terminal:

`defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder`

To disable:

`defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder`

## Credit

Thanks to [@cowboy](https://github.com/cowboy/dotfiles) for his awesome
dotfiles! His design philosophy of separating configurations into `bin`,
`link`, and `copy` make managing everything a heck of a lot easier. His
configuration and utility scripts have proved invaluable both as references and
as a basis for my own personal touches. Where possible, I credit him for his
code and for his design philosophy. These scripts from him are mostly unchanged:

- dotfiles, count-commits, curlsubl, eachdir, manp, pid, serve, ssid, subl
