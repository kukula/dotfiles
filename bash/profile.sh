# In case of nano
export EDITOR=vim
alias vim='nvim'
alias ni='nvim'

# Enable colors
export CLICOLOR=1

# RVM
export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh

# Base16 Shell color switching
if [ -n "$PS1" ]; then # if statement guards adding these helpers for non-interative shells
  eval "$(~/dotfiles/base16-shell/profile_helper.sh)"
fi

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

# Git
if [ -f ~/dotfiles/bash/git-completion.bash ]; then
  . ~/dotfiles/bash/git-completion.bash
fi

# Postgress.app
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

# NPM
export PATH=$HOME/npm/bin:$PATH

# PhantomJS
export PHANTOMJS_BIN=phantomjs

# default Ruby
chruby 2.2.5

# I don't want to 'bundle exec'
mkdir -p .git/safe && export PATH=".git/safe/../../bin:$PATH"

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
