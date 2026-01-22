{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    android-tools
    vscodium
    nemo
    mpv
    zsh
    spicetify-cli
    starship
    fastfetch
    bat
    satty
    tela-circle-icon-theme
    bibata-cursors
    waybar-mpris
    ayugram-desktop
    tmux
    grim
    slurp
    wl-clipboard
    fzf
    less
  ];
}
