{
  inputs,
  pkgs,
  ...
}: {
  # niri-nix's NixOS module output is `nixosModules.default`
  # (sodiboo's was `nixosModules.niri`). `programs.niri.enable`/`.package`
  # stay the same option names as before - the README confirms the NixOS
  # side keeps the `programs.niri` namespace.
  imports = [inputs.niri.nixosModules.default];
  programs.niri.enable = true;
  programs.niri.package = pkgs.niri;

  # Optional, on by default, mentioned here in case you want to tweak them:
  # programs.niri.withUWSM = true;   # launch niri via UWSM
  # programs.niri.withXDG  = true;   # auto-configure the XDG portal
}
