{pkgs, ...}: {
  home.packages = with pkgs; [
    # CLI utilities
    just
    bat
    less
    jq
    tree
    zip
    ripgrep
    fd
    yazi
    claude-code

    # Media / downloads
    aria2
    yt-dlp
    ffmpeg

    # Screenshots / clipboard
    grim
    slurp
    satty
    wl-clipboard

    # Android
    scrcpy
    android-tools

    # Desktop / theming
    nautilus
    tela-circle-icon-theme
    bibata-cursors
    awww
    wallpaper-picker
    libnotify
    networkmanagerapplet

    # Apps
    ayugram-desktop
    stremio-linux-shell
    vesktop

    # Dev tools
    lazygit
    nil
    imagemagick

    # Networking
    cloudflared
  ];
}
