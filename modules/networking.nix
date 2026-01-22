{ config, lib, pkgs, ... }:

{
  # Network configuration
  networking = {
    networkmanager.enable = true;
    useDHCP = false;
    nameservers = [ ];
  };

  # Bluetooth support
  hardware.bluetooth.enable = true;

  # DNS over TLS with NextDNS
  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNS = [
          "45.90.28.0#8d4376.dns.nextdns.io"
          "2a07:a8c0::#8d4376.dns.nextdns.io"
          "45.90.30.0#8d4376.dns.nextdns.io"
          "2a07:a8c1::#8d4376.dns.nextdns.io"
        ];
        DNSOverTLS = "yes";
        DNSSEC = "allow-downgrade";
        Domains = [ "~." ];
        FallbackDNS = [ "1.1.1.1" "1.0.0.1" ];
      };
    };
  };
}
