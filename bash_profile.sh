# Base16 Shell
BASE16_SHELL="$HOME/dotfiles/bash/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Promt 
PROMPT_SHELL="$HOME/dotfiles/bash/prompt.sh"
[[ -s $PROMPT_SHELL ]] && source $PROMPT_SHELL

# RVM
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# JAVA
export JAVA_HOME="$(/usr/libexec/java_home)"
export JAVA_OPTS="-Xmx3g -Xms1g"
export JRUBY_OPTS="-Xcompile.invokedynamic=false -J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=1 -J-noverify -Xcompile.mode=OFF"
export PATH=${JAVA_HOME}/bin:$PATH

# Aliases
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

alias pas='passenger start'
alias tr='torquebox deploy && torquebox run'
