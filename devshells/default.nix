{pkgs}:
pkgs.mkShell {
  name = "nixos-config";
  packages = with pkgs; [
    just
    alejandra
    statix
    deadnix
    nixd
    nix-update
    cachix
    nh
  ];
}
