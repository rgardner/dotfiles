# Cabal
export PATH="$HOME/.cabal/bin:$PATH"
export PATH="$HOME/bin:$PATH"

# NVIDIA CUDA
export PATH="/Developer/NVIDIA/CUDA-6.0/bin:$PATH"
export DYLD_LIBRARY_PATH="/Developer/NVIDIA/CUDA-6.0/lib:$DYLD_LIBRARY_PATH"

export GOPATH="$HOME/Developer/go"
export PATH="$PATH:$GOPATH/bin"

export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:$PATH"
# Added by Canopy installer on 2014-02-04
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1
VIRTUAL_ENV_DISABLE_PROMPT=1 source ~/Library/Enthought/Canopy_64bit/User/bin/activate

# Ruby
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
