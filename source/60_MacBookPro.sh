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
if test -f "$HOME"/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
    source "$HOME"/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
else
    # No, gpg-agent not available; start gpg-agent
    eval "$(gpg-agent --daemon --write-env-file "$HOME"/.gnupg/.gpg-agent-info)"
fi

# Aliases
alias arduino='/Applications/Arduino.app/Contents/MacOS/JavaApplicationStub'
alias hubb='hub browse'
alias lyricvpn='cd /usr/local/etc/openvpn && sudo openvpn --config client2.conf'
