_: {
  # Real KDL: `spawn-at-startup "waybar"` / `spawn-at-startup "sh" "-c" "..."`
  # - the program + its args are bare positional arguments of the node, not a
  # `command = [...]` property like sodiboo's typed option exposed. So this is
  # a list of lists: the outer list is one `spawn-at-startup` node per entry,
  # the inner list is that node's own argument list.
  wayland.windowManager.niri.settings.spawn-at-startup = [
    ["awww-daemon"]

    ["waybar"]

    [
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
    ]
  ];
}
