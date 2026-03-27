{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
    wget
    git
    gnupg
    htop
    brightnessctl
    unzip
  ];
}
