_: {
  imports = [
    ./hardware-configuration.nix
  ];

  my.kernel = {
    enable = true;
    hz = 1000;
    preempt = "full";
    march = "x86-64-v3";
    # scx = { enable = true; scheduler = "scx_lavd"; };
  };

  networking.hostName = "nixos";

  system.stateVersion = "25.11"; # do not change
}
