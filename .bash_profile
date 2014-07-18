if [ -f ~/.profile ]; then
   source ~/.profile
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

source ~/.git-prompt.sh
source ~/.git-completion.bash

# Coloring
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1="\[\e[0;36m\]\W\[\033[m\]\[\e[0;35m\]\$(__git_ps1)\[\e[m\]\$ "

# Enabling 256 colors
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# Platform independent aliases.
alias adventure='emacs -batch -l dunnet'
alias la='ls -A'
alias ll='ls -l'
alias serve='python -m SimpleHTTPServer'
alias up='cd ..'

# Platform independent functions.
function cdl { cd "$1"; ls; }
function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

# Platform specific aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

##
# Your previous /Users/bobgardner/.bash_profile file was backed up as /Users/bobgardner/.bash_profile.macports-saved_2014-07-15_at_16:29:54
##

# MacPorts Installer addition on 2014-07-15_at_16:29:54: adding an appropriate PATH variable for use with MacPorts.

# Finished adapting your PATH environment variable for use with MacPorts.
