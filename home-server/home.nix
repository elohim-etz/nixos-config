{ pkgs,username, ... }:

{

  imports = [
    ../modules/home-manager/programs/git.nix
    ../modules/home-manager/programs/zsh.nix
    ../modules/home-manager/programs/starship.nix
    ../modules/home-manager/programs/tmux.nix
    ../modules/home-manager/programs/fzf.nix

    ../modules/home-manager/nixvim
  ];

  home.username = username;
  home.homeDirectory = "/home/${username}";

  home.stateVersion = "26.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    fzf
    ripgrep
    fd
    bat
    eza
    just
    less
    jq
    tree
    zip
    claude-code
    aria2
    yt-dlp
    ffmpeg
    lazygit
    nil
  ];

}
