# In case of nano
export EDITOR=vim

# Enable colors
export CLICOLOR=1
export TERM="screen-256color"
alias tmux="tmux -2"

# Base16 Shell color switching
# if [ -n "$PS1" ]; then # if statement guards adding these helpers for non-interative shells
#   eval "$(~/dotfiles/base16-shell/profile_helper.sh)"
# fi

# Promt
PROMPT_SHELL="$HOME/dotfiles/bash/prompt.sh"
[[ -s $PROMPT_SHELL ]] && source $PROMPT_SHELL

# Ignore space and duplicates in history
export HISTCONTROL=ignoreboth:erasedups

# Colored grep
alias grep='grep -v grep | grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

export PATH="/usr/local/bin:$PATH"

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

# Postgress.app
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

# NPM
npm config set prefix /usr/local

# PhantomJS
export PHANTOMJS_BIN=phantomjs

# PyEnv
eval "$(pyenv init -)"

# RVM
export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
rvm use --default 2.4.1

# Aliases
alias la='ls -hal'
alias ll='ls -hAl'
alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'

# Simple calc in cli
function calc () {
  { echo "$*" | bc -l; }
}

# Alias for 'ps aux | grep'
function psgrep () {
  { ps aux | grep "$*"; }
}

export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
