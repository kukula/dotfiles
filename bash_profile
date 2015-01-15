function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo '✏ '
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | grep \* | awk '{print $2}'
}

function prompt_command_function
{
  git_dirty=$(parse_git_dirty)
  git_branch=$(parse_git_branch)

  git_dirty=${git_dirty:+" \[\e[31m\]$git_dirty\[\e[0m\]"}
  git_branch=${git_branch:+" (\[\e[1;36m\]${git_branch}\[\e[0m\]${git_dirty})"}

  PS1="\e[1;37m\]\w\[\e[0m\]$git_branch \e[1;32m\$\e[0m "
}

export PROMPT_COMMAND=prompt_command_function

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
alias ga='git add'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git pull'
alias gp='git push'
alias gs='git show'

alias pas='passenger start'
alias tr='torquebox deploy && torquebox run'
