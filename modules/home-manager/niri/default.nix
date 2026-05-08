{
  inputs,
  pkgs,
  ...
}: {

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];

  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  imports = [
    inputs.niri.homeModules.niri
    ./settings.nix
    ./theme.nix
    ./keybinds.nix
    ./rules.nix
    ./autostart.nix
  ];
}
