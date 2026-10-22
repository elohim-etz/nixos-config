{
  description = "My NixOS + Home Manager configuration";

  nixConfig = {
    extra-substituters = ["https://naveen-nixos.cachix.org"];
    extra-trusted-public-keys = ["naveen-nixos.cachix.org-1:T8g4TIX4n9FEEFlR3BjOS+QOKN2mLFUhQ0uMBFG87Jk="];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # Escape hatch for when unstable breaks something: pkgs.stable.<name>
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager";
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

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    assets = {
      url = "github:elohim-etz/nixos-assets";
      flake = false;
    };
  };

  outputs = {self, ...} @ inputs: let
    mylib = import ./lib {
      inherit inputs;
      outputs = self;
    };
    inherit (mylib) forAllSystems;
  in {
    overlays = import ./overlays {inherit inputs;};

    nixosConfigurations.laptop = mylib.mkHost {
      hostname = "laptop";
      username = "naveen";
    };

    # `home-manager switch --flake .#naveen@remote`
    homeConfigurations.remote = mylib.mkHome {
      homePath = ./home/naveen/remote.nix;
    };

    # My own derivations (pkgs/*) for CI to build/cache them individually
    packages = forAllSystems (pkgs: mylib.ownPackages pkgs);

    devShells = forAllSystems (pkgs: {
      default = import ./devshells/default.nix {inherit pkgs;};
      kompile = import ./devshells/kompile.nix {inherit pkgs;};
    });

    formatter = forAllSystems (pkgs: pkgs.alejandra);

    checks = forAllSystems (pkgs: {
      format = pkgs.runCommandLocal "check-format" {nativeBuildInputs = [pkgs.alejandra];} ''
        alejandra --check ${self} && touch $out
      '';
      statix = pkgs.runCommandLocal "check-statix" {nativeBuildInputs = [pkgs.statix];} ''
        statix check ${self} && touch $out
      '';
      deadnix = pkgs.runCommandLocal "check-deadnix" {nativeBuildInputs = [pkgs.deadnix];} ''
        deadnix --fail ${self} && touch $out
      '';
    });
  };
}
