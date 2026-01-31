{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
    wget
    git
    gnupg
    htop
    brightnessctl
    unzip
    (pkgs.callPackage ../stremio-linux-shell.nix {})
  ];
}
