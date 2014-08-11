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

# Bash Prompt
PS1="\$?|\[\e[0;31m\]\h\[\033[m\]|"
PS1="$PS1\[\e[0;36m\]\W\[\033[m\]"
export PS1="$PS1\[\e[0;34m\]\$(__git_ps1)\[\033[m\]\$ "

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

