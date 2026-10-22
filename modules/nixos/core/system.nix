_: {
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
