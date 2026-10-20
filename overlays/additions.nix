final: prev: let
  inherit (prev) lib;
  own = lib.packagesFromDirectoryRecursive {
    inherit (final) callPackage;
    directory = ../pkgs;
  };
in
  # Tells when nixpkgs has caught up and local copy can be deleted
  lib.mapAttrs (
    name: pkg:
      lib.warnIf (prev ? ${name})
      "overlays/additions: '${name}' now exists in nixpkgs, consider deleting pkgs/${name}"
      pkg
  )
  own
