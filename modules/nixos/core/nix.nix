{
  inputs,
  username,
  ...
}: {
  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" username];

      extra-substituters = ["https://naveen-nixos.cachix.org"];
      extra-trusted-public-keys = ["naveen-nixos.cachix.org-1:T8g4TIX4n9FEEFlR3BjOS+QOKN2mLFUhQ0uMBFG87Jk="];

      fallback = true;
      connect-timeout = 5;
      builders-use-substitutes = true;
      warn-dirty = false;
      log-lines = 30;
    };

    optimise.automatic = true;

    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = ["nixpkgs=${inputs.nixpkgs}"];
  };

  programs.nh = {
    enable = true;
    clean = {
      enable = true;
      extraArgs = "--keep-since 14d --keep 5";
    };
    flake = "/home/${username}/nixos-config";
  };
}
