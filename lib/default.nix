{ inputs, ... }:

let
  inherit (inputs) nixpkgs home-manager;

  overlays = import ../overlays inputs;
  importAll = import ./importAll.nix;

  pkgsFor = { system ? "x86_64-linux" }:
    import nixpkgs {
      inherit system overlays;
      config.allowUnfree = true;
    };
in {
  inherit overlays pkgsFor importAll;

  mkSystem = {
    system ? "x86_64-linux",
    hostPath,
    extraModules ? []
  }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        hostPath
        {
          nixpkgs.overlays = overlays;
        }
      ] ++ extraModules;
    };

  mkHome = {
    system ? "x86_64-linux",
    homePath
  }:
    home-manager.lib.homeManagerConfiguration {
      pkgs = pkgsFor { inherit system; };
      modules = [ homePath ];
      extraSpecialArgs = { inherit inputs; };
    };

  # helper for devshells
  mkDevShell = {
    system ? "x86_64-linux",
    shellPath
  }:
    import shellPath { pkgs = pkgsFor { inherit system; }; };
}
