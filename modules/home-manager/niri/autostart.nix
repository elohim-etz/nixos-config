{
  ...
}:

{
  programs.niri.settings.spawn-at-startup = [
    { command = [ "awww-daemon" ]; }
    { command = [ "waybar" ]; }
    {
      command = [
        "sh"
        "-c"
        "sleep 1 && awww img ~/nixos-config/assets/walls/degirled.png"
      ];
    }
  ];
}
