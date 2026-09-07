{inputs, ...}: {
  imports = [inputs.niri.nixosModules.default];
  programs.niri.enable = true;
}
