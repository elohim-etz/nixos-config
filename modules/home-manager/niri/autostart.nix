_: {
  programs.niri.settings.spawn-at-startup = [
    {command = ["awww-daemon"];}
    {command = ["waybar"];}
    {
      command = [
        "sh"
        "-c"
        ''
          sleep 1
          if [ -f "$HOME/.cache/current-wallpaper" ]; then
            awww img "$(cat $HOME/.cache/current-wallpaper)" \
              --transition-type fade --transition-duration 0.5
          else
            awww img ~/nixos-config/assets/walls/degirled.png
          fi
        ''
      ];
    }
  ];
}
