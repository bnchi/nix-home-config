{
  enable = true;
  extraConfig = ''
    unbind C-b
    set-option -g prefix C-a
    bind-key C-a send-prefix

    set -g base-index 1
    set-window-option -g mode-keys vi

    # vim-like pane switching
    bind -r ^ last-window
    bind -r k select-pane -U
    bind -r j select-pane -D
    bind -r h select-pane -L
    bind -r l select-pane -R

    bind-key ! break-pane -d -n _hidden_pane
    bind-key @ join-pane -s $.0
   '';
}
