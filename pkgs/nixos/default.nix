{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Core CLI
    wget
    git
    htop
    unzip
    zoxide

    # Hardware / display
    brightnessctl

    # Security / certs
    gnupg
    cacert

    # Networking / DNS
    nextdns
  ];
}
