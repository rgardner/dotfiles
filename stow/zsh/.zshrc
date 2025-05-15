# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  asdf
  autojump
  brew
  colored-man-pages
  direnv
  docker
  git
  heroku
  tmux
)

source $ZSH/oh-my-zsh.sh

# User configuration

# Make path elements unique
typeset -U path

export DOTFILES="${HOME}/.dotfiles"
path=("${DOTFILES}/bin" $path)

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export EDITOR="vim"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
alias code="code-insiders"
alias mj="memory_jogger"
alias update="brew upgrade && rustup update && omz update"
alias vsc="code-insiders"

batdiff() {
  git diff --name-only --relative --diff-filter=d | xargs bat --diff
}

fpath=("${HOMEBREW_PREFIX}/share/zsh/site-functions" $fpath)
fpath=("${HOME}/.zfunc" $fpath)

# Bazel
fpath=("${HOME}/.zsh/completion" $fpath)
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "${HOME}/.zsh/cache"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Go
path=("${HOME}/go/bin" $path)

# Julia
path=("/Applications/Julia-1.7.app/Contents/Resources/julia/bin" $path)

# Misc
path=("${HOME}/.local/bin" $path)
path=("${HOME}/bin" $path)

# Poetry
path=("${HOME}/.poetry/bin" $path)

# Ruby
eval "$(rbenv init -)"

# Rust
export CARGO_HOME="${CARGO_HOME:-${HOME}/.cargo}"
path=("${CARGO_HOME}/bin" $path)

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH="${HOME}/Library/Caches/heroku/autocomplete/zsh_setup" &&
  test -f $HEROKU_AC_ZSH_SETUP_PATH &&
  source $HEROKU_AC_ZSH_SETUP_PATH

# Source all my custom zsh files
setopt NULL_GLOB # allow empty glob
for file in $DOTFILES/source/*.zsh; do
  source "$file"
done
unsetopt NULL_GLOB

autoload -U compinit
compinit

autoload -U bashcompinit
bashcompinit

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
