# Paths
export ZSH_HOME=$HOME/.zsh
export GOPATH="${HOME}/go"
export GO111MODULE=on
test -d "${GOPATH}" || mkdir "${GOPATH}"
test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

path=(
	/usr/local/bin
	/usr/local/sbin
	$GOPATH/bin
	$GOROOT/bin
	$HOME/.cargo/bin
	$path
)

# ASDF
source $(brew --prefix asdf)/libexec/asdf.sh

# Editor
export EDITOR="nvim"
export VISUAL="nvim"

# Colors
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# History
export HISTFILE=$ZSH_HOME/.zsh_history
SHELL_SESSIONS_DISABLE=1
setopt SHARE_HISTORY
export HISTSIZE=10000
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# Plugins & themes
fpath=(
	$HOMEBREW_PREFIX/share/zsh/site-functions
	$fpath
)

# Prompt
autoload -Uz add-zsh-hook vcs_info
setopt prompt_subst
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
zstyle ':vcs_info:git:*' formats '%F{red}(%b%u%c)%f'
zstyle ':vcs_info:git:*' actionformats '%F{red}(%b|%a%u%c)%f'

TIME='%F{green}%*%f'
DIR='%F{blue}%~%f'
NEWLINE=$'\n'
PROMPT='${TIME} ${DIR} ${vcs_info_msg_0_} ${NEWLINE}$ '

# Completion
zmodload zsh/complist

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -U compinit; compinit

# Define completion
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZSH_HOME/.zcompcache"
zstyle ':completion:*' complete true
zstyle ':completion:*' menu select
zstyle ':completion:*' complete-options true
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'

# Aliases
alias update-nvim-nightly='asdf uninstall neovim nightly && asdf install neovim nightly'
