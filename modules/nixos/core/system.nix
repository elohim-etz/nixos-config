{ config, lib, pkgs, ... }:

{
  # Nix configuration
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
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

  # System services
  services = {
    dbus.enable = true;
  };
}
