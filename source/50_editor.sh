# Editing

if [[ ! "$SSH_TTY" ]] && is_macos; then
  export EDITOR='vim'
  export LESSEDIT='mvim -v ?lm+%ln -- %f'
  alias vi='mvim -v'
  alias vim='mvim -v'
else
  export EDITOR='vim'
fi

export VISUAL="$EDITOR"
alias q="$EDITOR"
alias qv="q $DOTFILES/link/.{,g}vimrc + 'cd $DOTFILES'"
alias qs="q $DOTFILES"
