_: {
  imports = [
    ./hardware-configuration.nix
  ];

  my.kernel = {
    enable = true;
    hz = 1000;
    preempt = "full";
    # march = "x86-64-v3"; # enable after confirming AVX2/BMI2/FMA in /proc/cpuinfo
    # scx = { enable = true; scheduler = "scx_lavd"; };
  };

  system.stateVersion = "25.11"; # do not change
}
