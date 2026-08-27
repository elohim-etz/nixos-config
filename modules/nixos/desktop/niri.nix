{
  inputs,
  pkgs,
  ...
}: {

  imports = [
    inputs.noctalia.nixosModules.default
    inputs.niri.nixosModules.default
  ];

  programs.noctalia = {
    enable = true;
    recommendedServices.enable = true;
    systemd.enable = true;
  };

  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;
}
