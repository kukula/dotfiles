# In case of nano
export EDITOR=vim

# Base16 Shell
BASE16_SHELL="$HOME/dotfiles/bash/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Promt 
PROMPT_SHELL="$HOME/dotfiles/bash/prompt.sh"
[[ -s $PROMPT_SHELL ]] && source $PROMPT_SHELL

# JAVA
export JAVA_HOME="$(/usr/libexec/java_home)"
export JAVA_OPTS="-Xmx3g -Xms1g"
export JRUBY_OPTS="-Xcompile.invokedynamic=false -J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -J-noverify -Xcompile.mode=OFF"

# Postgress.app
export PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

# Go
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# NPM
export PATH=$HOME/npm/bin:$PATH

# RVM
source ~/.rvm/scripts/rvm
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Aliases
alias ll='ls -hal'
alias v='vim'
alias g='git'
alias gst='git status'
alias gc='git commit'
alias gco='git checkout'
alias ga='git add'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git pull'
alias gp='git push'
alias gs='git show'
alias gb='git branch'

alias bi='bundle install'
alias be='bundle exec'

alias r='rails'

alias pass='passenger start'
alias torq='torquebox deploy && torquebox run'
