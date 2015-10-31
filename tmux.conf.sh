# play nice with OSX copy/paste tools
set -g default-command "reattach-to-user-namespace /bin/bash --login"
bind y run-shell "tmux save-buffer - | reattach-to-user-namespace pbcopy"

# spliting
bind | split-window -h # C-b | to create horizontal pane
bind - split-window -v # C-b - to create vertical pane

# moving between panes
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R

# resize panes - C-b <arrow key>
unbind Up
bind Up resize-pane -U 4
unbind Down
bind Down resize-pane -D 4
unbind Left
bind Left resize-pane -L 10
unbind Right
bind Right resize-pane -R 10

set -g default-terminal screen-256color
setw -g mode-keys vi # enable vi keys

# start windows and panes at 1, not 0
set -g base-index 1
set -g pane-base-index 1

#### COLOURS
# minimal status bar with clock
set -g status-left ""
set -g status-right "#[fg=colour244]%R"

# default statusbar colors
set-option -g status-bg black
set-option -g status-fg white
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg white
set-window-option -g window-status-bg black

# active window title colors
set-window-option -g window-status-current-fg white
set-window-option -g window-status-current-bg colour240

# title format
set -g window-status-format " #[fg=colour240]#I #[fg=colour244]#W "
set -g window-status-current-format " #[fg=colour244]#I #[fg=white]#W "

# pane border
set-option -g pane-border-fg colour240
set-option -g pane-active-border-fg colour3 #orange

# message text
set-option -g message-bg colour240
set-option -g message-fg colour3 #orange
