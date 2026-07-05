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

  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/wasabi/configuration.nix
          { nixpkgs.overlays = [ inputs.nix-cachyos-kernel.overlays.pinned ]; }
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
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        modules = [./home/home.nix];
        extraSpecialArgs = {inherit inputs;};
      };
    };
    packages.x86_64-linux = let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfreePredicate = pkg:
          builtins.elem (nixpkgs.lib.getName pkg) ["stremio-linux-shell"];
      };
    in {
      stremio-linux-shell = pkgs.stremio-linux-shell;
      linux-cachyos = inputs.nix-cachyos-kernel.legacyPackages.${system}.linuxPackages-cachyos-latest-lto-x86_64-v3.kernel;
    };
  };
}
