{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    niri = {
      url = "git+https://codeberg.org/BANanaD3V/niri-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs = { nixpkgs, ... } @ inputs: let
    lib = import ./lib { inherit inputs; };
    system = "x86_64-linux";
  in {
    nixosConfigurations.wasabi = lib.mkSystem {
      hostPath = ./hosts/wasabi/configuration.nix;
    };

    homeConfigurations.naveen = lib.mkHome {
      homePath = ./home/home.nix;
    };

    packages.${system} = let
      pkgs = lib.pkgsFor { inherit system; };
    in {
      stremio-linux-shell = pkgs.stremio-linux-shell;
      linux-cachyos = inputs.nix-cachyos-kernel.legacyPackages.${system}.linuxPackages-cachyos-latest-lto-x86_64-v3.kernel;
    };

    devShells.${system} = {
      kompile = lib.mkDevShell { shellPath = ./devshells/kompile.nix; };
    };
  };
}
