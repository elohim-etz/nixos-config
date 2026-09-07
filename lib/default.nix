{inputs, ...}: let
  inherit (inputs) nixpkgs;

  overlays = import ../overlays inputs;
  importAll = import ./importAll.nix;

  pkgsFor = {system ? "x86_64-linux"}:
    import nixpkgs {
      inherit system overlays;
      config.allowUnfree = true;
    };
in {
  inherit overlays pkgsFor importAll;

  mkSystem = {
    system ? "x86_64-linux",
    hostPath,
    extraModules ? [],
  }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {inherit inputs;};
      modules =
        [
          hostPath
          {
            nixpkgs.overlays = overlays;
            nixpkgs.config.allowUnfree = true;
          }
        ]
        ++ extraModules;
    };

  # helper for devshells
  mkDevShell = {
    system ? "x86_64-linux",
    shellPath,
  }:
    import shellPath {pkgs = pkgsFor {inherit system;};};
}
