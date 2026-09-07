_: {
  networking.networkmanager = {
    enable = true;
    dns = "systemd-resolved";
  };

  services.resolved = {
    enable = true;

    settings.Resolve = {
      DNS = [
        "45.90.28.0#8d4376.dns.nextdns.io"
        "2a07:a8c0::#8d4376.dns.nextdns.io"
        "45.90.30.0#8d4376.dns.nextdns.io"
        "2a07:a8c1::#8d4376.dns.nextdns.io"
      ];

      DNSOverTLS = "yes";
      DNSSEC = "allow-downgrade";
      Domains = ["~."];
    };
  };
}
