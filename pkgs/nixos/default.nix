{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Core CLI
    wget
    git
    htop
    unzip
    zoxide

    # Security / certs
    gnupg
    cacert

    # Networking / DNS
    nextdns
  ];
}
