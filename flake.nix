{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

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
    lib = import ./lib {inherit inputs;};
    system = "x86_64-linux";
  in {
    nixosConfigurations.laptop = lib.mkSystem {
      hostPath = ./hosts/laptop/configuration.nix;
    };

    homeConfigurations = {
      home-server = lib.mkHome {
        username = "elohim";
        homePath = ./home-server/home.nix;
      };
    };

    devShells.${system} = {
      kompile = lib.mkDevShell {shellPath = ./devshells/kompile.nix;};
    };
  };
}
