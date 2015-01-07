# .bashrc is read and executed when an interactive shell that is not a login
#   shell starts. Most *nix platforms use non-login shells when starting their
#   terminal emulators. The Mac OS X terminal, on the other hand, starts login
#   shells instead, so .bash_profile is executed instead of .bashrc
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

# .profile is read by many shells if their own shell-specific config files are
#   not found. Some shells (such as Bash), still read .profile, but it is the
#   lowest config file in the hierarchy.
if [ -f ~/.profile ]; then
   source ~/.profile
fi

# Add my custom scripts to the path.
export PATH="$HOME/.dotfiles/bin:$PATH"

source ~/.git-prompt.sh
source ~/.git-completion.bash
source ~/.ssh-auto-completion.sh

# Coloring
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Enabling 256 colors
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# Bash Prompt
export GIT_PS1_SHOWDIRTYSTATE=1

export PS1="\$?|\[\e[0;31m\]\h\[\033[m\]|"  # exit status | hostname
export PS1="$PS1\[\e[0;36m\]\w\[\033[m\]"   # working directory
export PS1="$PS1\[\e[0;34m\]\$(__git_ps1 ' (%s)')\[\033[m\]\n\$ "  # git branch

# Platform independent aliases.
alias dotf='cd ~/.dotfiles'
alias la='ls -A'
alias ll='ls -l'
alias less='less -FX'
alias up='cd ..'

# Platform independent functions.
function cdl { cd "$1"; ls; }
function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# Platform dependent config files. Possible operating system names include:
#   Darwin|FreeBSD|Linux|NetBSD|OpenBSD.
[ -f ~/.bashrc_"$(uname -s)" ] && source ~/.bashrc_"$(uname -s)"

# Computer specific files. Ensure that hostnames are unique.
[ -f ~/.bashrc_"$(hostname -s)" ] && source ~/.bashrc_"$(hostname -s)"

# Private computer specific aliases. These will not be kept in version control.
[ -f ~/.bashrc_LOCAL ] && source ~/.bashrc_LOCAL
