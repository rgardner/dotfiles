if [ -f !/.bashrc ]; then
  source ~/.bashrc
fi

source ~/.git-prompt.sh
source ~/.git-completion.bash
source ~/.hub-completion.sh

export EDITOR="$HOME/scripts/editor.sh"
#coloring
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1="\[\e[0;36m\]\W\[\033[m\]\[\e[0;35m\]\$(__git_ps1)\[\e[m\]$ "

# enabling 256 colors
if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
else
  export TERM='xterm-color'
fi

# aliases
alias adventure='emacs -batch -l dunnet'
alias la='ls -A'
alias ll='ls -l'

# directory aliases
alias blog='cd ~/Developer/weblog'
alias code='cd ~/Developer'
alias desk='cd ~/Desktop'
alias me='cd ~/Documents/me'
alias school='cd ~/Documents/School-Documents/NYU/Sophomore-Year/Second-Semester'
alias work='cd ~/Documents/work/kinetic_social/projects'
alias up='cd ..'

# ssh and ftp aliases
alias linode='ssh bob@96.126.111.209'
alias nyuSol='ssh rhg259@i5.nyu.edu'
alias nyuLin='ssh rhg259@access.cims.nyu.edu'
alias pks='ftp menoftheskulls.com'

# mac utilities shortcuts
function cdl { cd $1; ls; }
function mkcd () { mkdir -p "$@" && eval cd "\"\$$#\""; }

clearOpenWithMenu() {
  /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
}

hideSpotlightIcon() {
  sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
  killall SystemUIServer
}

showSpotlightIcon() {
  sudo chmod 755 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
  killall SystemUIServer
}

startPostgres() {
  pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
}

# Ruby
export PATH=/usr/local/bin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Rails
export MAILER_EMAIL=rgardner929@gmail.com
export MAILER_PASSWORD='+w,8rP28yzg$ar'

# Added by Canopy installer on 2014-02-04
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1
VIRTUAL_ENV_DISABLE_PROMPT=1 source /Users/bobgardner/Library/Enthought/Canopy_64bit/User/bin/activate
