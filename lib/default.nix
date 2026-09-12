{inputs, ...}: let
  inherit (inputs) nixpkgs home-manager;

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

  mkHome = {
    system ? "x86_64-linux",
    homePath,
    username,
    extraModules ? [],
  }:
    home-manager.lib.homeManagerConfiguration {
      pkgs = pkgsFor { inherit system; };

      extraSpecialArgs = {
        inherit inputs username;
      };

      modules =
        [
          homePath
        ]
        ++ extraModules;
    };

  mkDevShell = {
    system ? "x86_64-linux",
    shellPath,
  }:
    import shellPath {pkgs = pkgsFor {inherit system;};};
}
