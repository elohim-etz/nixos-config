{
  inputs,
  outputs,
}: let
  inherit (inputs) nixpkgs home-manager;
  inherit (nixpkgs) lib;

  systems = ["x86_64-linux"];

  pkgsFor = system:
    import nixpkgs {
      inherit system;
      overlays = [outputs.overlays.default];
      config.allowUnfree = true;
    };
in {
  inherit systems pkgsFor;

  # forAllSystems (pkgs: { ... }) -> { x86_64-linux = { ... }; ... }
  forAllSystems = f: lib.genAttrs systems (system: f (pkgsFor system));

  # Every derivation under ./pkgs, auto-discovered (pkgs/<name>/package.nix).
  # Used by overlays/additions.nix and by the flake's `packages` output.
  ownPackages = pkgs:
    lib.filterAttrs (_: lib.meta.availableOn pkgs.stdenv.hostPlatform)
    (lib.packagesFromDirectoryRecursive {
      inherit (pkgs) callPackage;
      directory = ../pkgs;
    });

  mkHost = {
    hostname,
    username,
    system ? "x86_64-linux",
    extraModules ? [],
  }: let
    args = {inherit inputs outputs hostname username;};
  in
    lib.nixosSystem {
      inherit system;
      specialArgs = args;
      modules =
        [
          {
            nixpkgs.overlays = [outputs.overlays.default];
            nixpkgs.config.allowUnfree = true;
          }
          ../hosts/${hostname}
          ../modules/nixos
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "hm-bak";
              extraSpecialArgs = args;
              users.${username} = import ../home/${username}/${hostname}.nix;
            };
          }
        ]
        ++ extraModules;
    };

  # Standalone Home Manager (servers / non-NixOS)
  mkHome = {
    username,
    profile,
    system ? "x86_64-linux",
    homeDirectory ? "/home/${username}",
    extraModules ? [],
  }:
    home-manager.lib.homeManagerConfiguration {
      pkgs = pkgsFor system;
      extraSpecialArgs = {inherit inputs outputs username;};
      modules =
        [
          ../home/${username}/${profile}.nix
          {home = {inherit username homeDirectory;};}
        ]
        ++ extraModules;
    };
}
