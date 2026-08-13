{ inputs, ... }:

let
  inherit (inputs) nixpkgs home-manager;

  overlays = import ../overlays inputs;
  importAll = import ./importAll.nix;

  unfreePredicate = pkg:
    builtins.elem (nixpkgs.lib.getName pkg) [
      "stremio-linux-shell"
    ];

  pkgsFor = { system ? "x86_64-linux" }:
    import nixpkgs {
      inherit system overlays;
      config.allowUnfreePredicate = unfreePredicate;
    };
in {
  inherit overlays unfreePredicate pkgsFor importAll;

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
        { nixpkgs.overlays = overlays; }
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
}
