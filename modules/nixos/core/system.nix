{pkgs, ...}: {
  # Nix configuration
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];

    # CachyOS kernel binary cache
    substituters = ["https://attic.xuyh0120.win/lantian"];
    trusted-public-keys = ["lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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

  environment.systemPackages = with pkgs; [
    bash
    home-manager
  ];

  # Fix /bin/sh
  environment.binsh = "${pkgs.bash}/bin/bash";

  # System services
  services = {
    dbus.enable = true;
    gvfs.enable = true;
  };
}
