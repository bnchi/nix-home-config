unbind C-b
set-option -g prefix C-a
bind-key C-a send-prefix

set -g base-index 1
set-option -g default-shell /bin/zsh
set-window-option -g mode-keys vi
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel "pbcopy"

# vim-like pane switching
bind -r ^ last-window
bind -r k select-pane -U
bind -r j select-pane -D
bind -r h select-pane -L
bind -r l select-pane -R
