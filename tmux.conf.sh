set-option -g default-command "reattach-to-user-namespace -l bash"

set -g history-limit 10000

set -g base-index 1
set -g pane-base-index 1

set -g base-index 1
set -g pane-base-index 1
set -g set-titles on
set -g set-titles-string "#S:#I:#P #W #T"
set -g status-utf8 on
set -g status-right "#[fg=white]%H:%M#[default]"

# Colors
set -g default-terminal "screen-256color"
set -g status-bg colour235
set -g status-fg white

set -g status-left ""
set -g status-right "%R"

set-window-option -g window-status-current-fg black
set-window-option -g window-status-current-bg white

set -g pane-border-fg colour235
set -g pane-border-bg black
set -g pane-active-border-fg white

# Key bindings
bind -r h select-pane -L
bind -r j select-pane -D
bind -r k select-pane -U
bind -r l select-pane -R

# Copy-paste integration
set-option -g default-command "reattach-to-user-namespace -l bash"

# Use vim keybindings in copy mode
setw -g mode-keys vi

# Setup 'v' to begin selection as in Vim
bind-key -t vi-copy v begin-selection
bind-key -t vi-copy y copy-pipe "reattach-to-user-namespace pbcopy"

# Update default binding of `Enter` to also use copy-pipe
unbind -t vi-copy Enter
bind-key -t vi-copy Enter copy-pipe "reattach-to-user-namespace pbcopy"

# Bind ']' to use pbpaste
bind ] run "reattach-to-user-namespace pbpaste | tmux load-buffer - && tmux paste-buffer"
