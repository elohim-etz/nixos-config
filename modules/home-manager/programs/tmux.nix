{
  pkgs,
  themeColors,
  ...
}: {
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    baseIndex = 1;
    escapeTime = 0;
    historyLimit = 10000;
    terminal = "screen-256color";

    plugins = with pkgs.tmuxPlugins; [
      sensible
      yank
      resurrect
      continuum
      {
        plugin = resurrect;
        extraConfig = ''
          set -g @resurrect-capture-pane-contents 'on'
          set -g @resurrect-strategy-nvim 'session'
        '';
      }
      {
        plugin = continuum;
        extraConfig = ''
          set -g @continuum-restore 'off'
          set -g @continuum-save-interval '15'
        '';
      }
      {
        plugin = prefix-highlight;
        extraConfig = ''
          set -g @prefix_highlight_fg "${themeColors.base}"
          set -g @prefix_highlight_bg "${themeColors.green}"
          set -g @prefix_highlight_show_copy_mode 'on'
          set -g @prefix_highlight_copy_mode_attr "fg=${themeColors.base},bg=${themeColors.yellow}"
          set -g @prefix_highlight_show_sync_mode 'on'
          set -g @prefix_highlight_sync_mode_attr "fg=${themeColors.base},bg=${themeColors.red}"
          set -g @prefix_highlight_prefix_prompt ' WAIT '
          set -g @prefix_highlight_copy_prompt ' COPY '
          set -g @prefix_highlight_sync_prompt ' SYNC '
        '';
      }
    ];

    extraConfig = ''
      # Terminal overrides
      set -ga terminal-overrides ",*256col*:Tc"
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'

      # General settings
      set -g repeat-time 1000
      setw -g pane-base-index 1
      setw -g monitor-activity on
      set -g visual-activity off
      set -g renumber-windows on
      set -g focus-events on
      set -g display-time 2000
      set -g display-panes-time 2000
      setw -g mode-keys vi

      # Window/pane titles
      set-window-option -g automatic-rename on
      set-option -g set-titles on
      set-option -g set-titles-string "#S / #W"
      set-option -g allow-rename off

      # Bell
      set -g visual-bell off
      set -g bell-action none

      # Key bindings - Reload config
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display "⚡ Tmux config reloaded!"

      # Split windows
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      bind '\' split-window -h -c "#{pane_current_path}"
      bind '_' split-window -v -c "#{pane_current_path}"

      # New window
      bind N new-window -c "#{pane_current_path}"
      bind c new-window -c "#{pane_current_path}"

      # Synchronize panes
      bind y setw synchronize-panes

      # Pane navigation (vim-like)
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Window navigation
      bind -r C-h select-window -t :-
      bind -r C-l select-window -t :+

      # Resize panes
      bind -r H resize-pane -L 5
      bind -r J resize-pane -D 5
      bind -r K resize-pane -U 5
      bind -r L resize-pane -R 5

      # Move windows
      bind -r "<" swap-window -d -t -1
      bind -r ">" swap-window -d -t +1

      # Zoom pane
      bind m resize-pane -Z

      # Copy mode
      bind Enter copy-mode
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy"
      bind -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "wl-copy"

      # Paste
      bind p paste-buffer
      bind C-p choose-buffer

      # Kill pane/window
      bind x kill-pane
      bind X kill-window

      # Session management
      bind C-c new-session
      bind C-f command-prompt -p find-session 'switch-client -t %%'

      # Toggle status bar
      bind b set-option -g status

      # Catppuccin Mocha Theme
      set -g status-interval 2
      set -g status-position bottom
      set -g status-justify left
      set -g status-style "bg=${themeColors.base},fg=${themeColors.text}"

      set -g status-left-length 100
      set -g status-left "#[fg=${themeColors.base},bg=${themeColors.blue},bold]  #S #[fg=${themeColors.blue},bg=${themeColors.surface0}]#[fg=${themeColors.text},bg=${themeColors.surface0}] #(whoami) #[fg=${themeColors.surface0},bg=${themeColors.base}]"

      set -g status-right-length 200
      set -g status-right "#[fg=${themeColors.surface0},bg=${themeColors.base}]#[fg=${themeColors.text},bg=${themeColors.surface0}] #{session_windows} 󰖯 #[fg=${themeColors.surface1},bg=${themeColors.surface0}]#[fg=${themeColors.text},bg=${themeColors.surface1}] #{pane_current_path} #[fg=${themeColors.surface0},bg=${themeColors.surface1}]#[fg=${themeColors.text},bg=${themeColors.surface0}]  %Y-%m-%d #[fg=${themeColors.blue},bg=${themeColors.surface0}]#[fg=${themeColors.base},bg=${themeColors.blue},bold]  %H:%M #[fg=${themeColors.mauve},bg=${themeColors.blue}]#[fg=${themeColors.base},bg=${themeColors.mauve},bold] 󰍹 #H "

      set -g window-status-format "#[fg=${themeColors.base},bg=${themeColors.surface0}]#[fg=${themeColors.text},bg=${themeColors.surface0}] #I #W#{?window_zoomed_flag, 󰁌 ,}#[fg=${themeColors.surface0},bg=${themeColors.base}]"
      set -g window-status-current-format "#[fg=${themeColors.base},bg=${themeColors.mauve}]#[fg=${themeColors.base},bg=${themeColors.mauve},bold] #I #W#{?window_zoomed_flag, 󰁌 ,}#[fg=${themeColors.mauve},bg=${themeColors.base}]"
      set -g window-status-separator ""
      set -g window-status-activity-style "fg=${themeColors.yellow},bg=${themeColors.base}"

      set -g pane-border-style "fg=${themeColors.surface0}"
      set -g pane-active-border-style "fg=${themeColors.blue}"
      set -g pane-border-format "#[fg=${themeColors.blue},bg=${themeColors.base}] #{?pane_active,#[bold],}#{pane_index} #{pane_current_command} "

      set -g display-panes-active-colour "${themeColors.yellow}"
      set -g display-panes-colour "${themeColors.blue}"

      set -g message-style "fg=${themeColors.sky},bg=${themeColors.surface0},bold"
      set -g message-command-style "fg=${themeColors.sky},bg=${themeColors.surface0},bold"

      set -g mode-style "fg=${themeColors.base},bg=${themeColors.yellow}"

      setw -g clock-mode-colour "${themeColors.blue}"
    '';
  };
}
