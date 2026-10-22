{...}: {
  home = {
    username = "naveen";
    homeDirectory = "/home/naveen";
    stateVersion = "25.11";
  };

  imports = [
    ../../modules/home-manager
  ];

  programs.home-manager.enable = true;
}
