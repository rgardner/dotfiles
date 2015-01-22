# Bash Prompt
export GIT_PS1_SHOWDIRTYSTATE=1

export PS1="\$?|\[\e[0;31m\]\h\[\033[m\]|"  # exit status | hostname
export PS1="$PS1\[\e[0;36m\]\w\[\033[m\]"   # working directory
export PS1="$PS1\[\e[0;34m\]\$(__git_ps1 ' (%s)')\[\033[m\]\n\$ "  # git branch
