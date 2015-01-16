unbind C-b

set -g prefix C-a

set -g base-index 1
set -g pane-base-index 1
set -g default-terminal "xterm-256color"
set -g set-titles on
set -g set-titles-string "#S:#I:#P #W #T"
set -g status-utf8 on
set -g status-right "#[fg=white]%H:%M#[default]"

#### COLOUR (Solarized 256)

# default statusbar colors
set-option -g status-bg colour235 #base02
set-option -g status-fg colour136 #yellow
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg colour244 #base0
set-window-option -g window-status-bg default
#set-window-option -g window-status-attr dim

# active window title colors
set-window-option -g window-status-current-fg colour166 #orange
set-window-option -g window-status-current-bg default
#set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour235 #base02
set-option -g pane-active-border-fg colour240 #base01

# message text
set-option -g message-bg colour235 #base02
set-option -g message-fg colour166 #orange

# pane number display
set-option -g display-panes-active-colour colour33 #blue
set-option -g display-panes-colour colour166 #orange

# clock
set-window-option -g clock-mode-colour colour64 #green
setw -g automatic-rename

# Key bindings

bind r source-file ~/.tmux.conf \; display "Reloaded config."

bind -r h select-pane -L
bind -r j select-pane -D
bind -r k select-pane -U
bind -r l select-pane -R

# Sessions

new
