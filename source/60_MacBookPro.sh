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

# Python
source /usr/local/opt/autoenv/activate.sh

# Node.js
source ~/.nvm/nvm.sh
export NVM_DIR="/Users/bobgardner/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Ruby
export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Autojump support.
[[ -s "$(brew --prefix)"/etc/autojump.sh ]] && . "$(brew --prefix)"/etc/autojump.sh

# Aliases
alias arduino='/Applications/Arduino.app/Contents/MacOS/JavaApplicationStub'
alias hr='heroku restart'
