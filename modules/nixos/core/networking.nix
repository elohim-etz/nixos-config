{ config, lib, pkgs, ... }:

{
  networking = {
    networkmanager.enable = true;
    networkmanager.dns = "default";
  };

  services.resolved.enable = false;

  services.nextdns = {
    enable = true;
    arguments = [
      "-config" "8d4376"
      "-cache-size" "10MB"
      "-max-ttl" "5m"
      "-report-client-info"
      "-bogus-priv"
      "-timeout" "5s"
      "-auto-activate"
    ];
  };
}
