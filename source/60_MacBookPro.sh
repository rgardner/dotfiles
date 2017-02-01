is_macos || return 1

# Postgres
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin"

# Cabal
export PATH="$HOME/.cabal/bin:$PATH"

# NVIDIA CUDA
export PATH="/Developer/NVIDIA/CUDA-6.0/bin:$PATH"
export DYLD_LIBRARY_PATH="/Developer/NVIDIA/CUDA-6.0/lib:$DYLD_LIBRARY_PATH"

# Go
export GOPATH="$HOME/Developer/go"
export PATH="$GOPATH/bin:$PATH"

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Ruby
export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
# Load RVM into a shell session *as a function *
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Autoenv
source /usr/local/opt/autoenv/activate.sh

# Autojump support.
[[ -s "$(brew --prefix)"/etc/autojump.sh ]] && . "$(brew --prefix)"/etc/autojump.sh

# Bash completion.
if [ -f "$(brew --prefix)"/etc/bash_completion ]; then
  . "$(brew --prefix)"/etc/bash_completion
fi

# GPG
# kill -0 checks to see if the pid exists
if test -f $HOME/.gpg-agent-info && kill -0 `cut -d: -f 2 $HOME/.gpg-agent-info` 2>/dev/null; then
    GPG_AGENT_INFO=`cat $HOME/.gpg-agent-info | cut -c 16-`
else
# No, gpg-agent not available; start gpg-agent
    eval `gpg-agent --daemon --no-grab --write-env-file $HOME/.gpg-agent-info`
fi
export GPG_TTY=`tty`
export GPG_AGENT_INFO

# Aliases
alias arduino='/Applications/Arduino.app/Contents/MacOS/JavaApplicationStub'
alias hubb='hub browse'
