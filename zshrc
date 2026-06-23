# Paths
export ZSH_HOME=$HOME/.zsh
export GOPATH="${HOME}/go"
export PKG_CONFIG_PATH="$HOMEBREW_PREFIX/opt/openssl/lib/pkgconfig"

path=(
	/usr/local/bin
	/usr/local/sbin
	$GOPATH/bin
	$HOME/.cargo/bin
	$HOME/.local/bin
	$HOME/.pulumi/bin
	$HOME/Library/pnpm
	/opt/homebrew/opt/postgresql@18/bin
	$path
)

# ASDF (v0.16+ is a Go binary; just add shims to PATH and load completions)
export ASDF_DATA_DIR="${ASDF_DATA_DIR:-$HOME/.asdf}"
path=("${ASDF_DATA_DIR}/shims" $path)
fpath=("$HOMEBREW_PREFIX/opt/asdf/share/zsh/site-functions" $fpath)

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

# Prune dangling completion symlinks (e.g. Docker.app removing its bundled
# completions) so compinit doesn't error on a missing target.
() {
	local brew_comps="$HOMEBREW_PREFIX/share/zsh/site-functions"
	[[ -d "$brew_comps" ]] || return
	local f
	for f in "$brew_comps"/_*(N); do
		[[ -h "$f" && ! -e "$f" ]] && rm -f "$f"
	done
}

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

