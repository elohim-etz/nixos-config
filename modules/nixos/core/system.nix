_: {
  # Nix configuration
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    substituters = ["https://naveen-nixos.cachix.org?priority=1"];
    trusted-public-keys = ["naveen-nixos.cachix.org-1:T8g4TIX4n9FEEFlR3BjOS+QOKN2mLFUhQ0uMBFG87Jk="];
    trusted-users = ["root" "naveen"];
  };

  nix.optimise.automatic = true;

  # Localization
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  # System programs
  programs = {
    # Enable zsh system-wide
    zsh.enable = true;

    # GnuPG agent
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    # Enable dconf for GTK applications
    dconf.enable = true;
  };

  # System services
  services = {
    dbus.enable = true;
    gvfs.enable = true;
  };
}
