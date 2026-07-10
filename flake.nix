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
      url = "github:sodiboo/niri-flake";
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

  outputs = {nixpkgs, ...} @ inputs: let
    system = "x86_64-linux";
    overlays = [
      inputs.nix-cachyos-kernel.overlays.pinned
      (import ./pkgs/overlays.nix)
    ];
    unfreePredicate = pkg:
      builtins.elem (nixpkgs.lib.getName pkg) ["stremio-linux-shell"];
  in {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/wasabi/configuration.nix
          { nixpkgs.overlays = overlays; }
          {
            nix.settings = {
              substituters = ["https://naveen-nixos.cachix.org?priority=1"];
              trusted-public-keys = ["naveen-nixos.cachix.org-1:T8g4TIX4n9FEEFlR3BjOS+QOKN2mLFUhQ0uMBFG87Jk="];
            };
          }
        ];
      };
    };

    homeConfigurations = {
      naveen = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system overlays;
          config.allowUnfreePredicate = unfreePredicate;
        };
        modules = [./home/home.nix];
        extraSpecialArgs = {inherit inputs;};
      };
    };
    packages.${system} = let
      pkgs = import nixpkgs {
        inherit system overlays;
        config.allowUnfreePredicate = unfreePredicate;
      };
    in {
      stremio-linux-shell = pkgs.stremio-linux-shell;
      linux-cachyos = inputs.nix-cachyos-kernel.legacyPackages.${system}.linuxPackages-cachyos-latest-lto-x86_64-v3.kernel;
    };
  };
}
