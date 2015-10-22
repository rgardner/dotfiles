is_osx || return 1

# Postgres
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin"

# Cabal
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# NVIDIA CUDA
export PATH="/Developer/NVIDIA/CUDA-6.0/bin:$PATH"
export DYLD_LIBRARY_PATH="/Developer/NVIDIA/CUDA-6.0/lib:$DYLD_LIBRARY_PATH"

# Go
export GOPATH="$HOME/Developer/go"
export PATH="$PATH:$GOPATH/bin"

# Ruby
export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Rust
export PATH="$PATH:$HOME/.cargo/bin"

# Autojump support.
[[ -s "$(brew --prefix)"/etc/autojump.sh ]] && . "$(brew --prefix)"/etc/autojump.sh

# Bash completion.
if [ -f "$(brew --prefix)"/etc/bash_completion ]; then
  . "$(brew --prefix)"/etc/bash_completion
fi

# Aliases
alias arduino='/Applications/Arduino.app/Contents/MacOS/JavaApplicationStub'
alias hr='heroku restart'
