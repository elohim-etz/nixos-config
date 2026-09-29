{
  pkgs,
  username,
  ...
}: {
  imports = [
    ../../modules/home-manager/programs/git.nix
    ../../modules/home-manager/programs/zsh.nix
    ../../modules/home-manager/programs/starship.nix
    ../../modules/home-manager/programs/tmux.nix
    ../../modules/home-manager/programs/fzf.nix
    ../../modules/home-manager/programs/fastfetch.nix
    ../../modules/home-manager/programs/btop.nix
    ../../modules/home-manager/theme/theme.nix

    ../../modules/home-manager/nixvim
  ];

  home = {
    inherit username;
    homeDirectory = let
      h = builtins.getEnv "HOME";
    in
      if h != ""
      then h
      else "/home/${username}";
    stateVersion = "25.11";
  };

  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    PAGER = "less";
    MANPAGER = "less -R";
  };

  home.packages = with pkgs; [
    # Core CLI
    ripgrep
    fd
    bat
    eza
    less
    jq
    tree

    # Archives / files
    zip
    unzip
    p7zip
    ouch

    # System / disk
    dust
    duf
    ncdu

    # Networking
    curl
    wget
    aria2
    speedtest-cli

    # Git / development
    git
    lazygit
    just
    nil

    # Media / download
    yt-dlp
    ffmpeg

    # Productivity
    zoxide

    # Misc
    claude-code
  ];
}
