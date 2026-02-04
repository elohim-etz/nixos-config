{ pkgs, ... }:

{
  home.packages = with pkgs; [
    kitty
    android-tools
    vscodium
    nautilus
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
    jq
    aria2
    yt-dlp
    ffmpeg
    yazi
    tree
    zip

    ripgrep
    fd
    lazygit
  ];
}
