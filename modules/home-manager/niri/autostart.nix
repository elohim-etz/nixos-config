{
  ...
}:

{
  programs.niri.settings.spawn-at-startup = [
    { command = [ "swww-daemon" ]; }
    { command = [ "waybar" ]; }
    {
      command = [
        "sh"
        "-c"
        "sleep 1 && swww img ~/nixos-config/assets/walls/flowering-rain.png"
      ];
    }
  ];
}
