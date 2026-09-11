{ ... }:

{
  home = {
    username = "naveen";
    homeDirectory = "/home/naveen";
    stateVersion = "25.11";
  };

  imports = [
    ../../modules/home-manager/programs/git.nix
    ../../modules/home-manager/programs/fzf.nix
    ../../modules/home-manager/programs/zsh.nix
    ../../modules/home-manager/programs/starship.nix
    ../../modules/home-manager/programs/tmux.nix
    ../../modules/home-manager/programs/fastfetch.nix

    ../../modules/home-manager/nixvim
  ];

  programs.home-manager.enable = true;

  home.packages = [
  ];
}
