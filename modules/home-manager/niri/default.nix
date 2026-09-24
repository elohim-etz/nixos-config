{ pkgs, ... }:
{
  imports = [
    ./session.nix
    ./devices.nix
    ./appearance.nix
    ./binds.nix
    ./rules.nix
  ];

  wayland.windowManager.niri = {
    enable = true;

    package = pkgs.niri;

    systemd.enable = false;
    portalPackage = null;

    checkConfig = true;
  };
}
