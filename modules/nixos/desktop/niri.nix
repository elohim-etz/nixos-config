{
  inputs,
  pkgs,
  ...
}: {
  imports = [inputs.niri.nixosModules.default];
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;
}
