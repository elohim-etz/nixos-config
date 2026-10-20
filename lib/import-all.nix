lib: dir: let
  entries = builtins.readDir dir;
  importable = name: type:
    (type == "regular" && lib.hasSuffix ".nix" name && name != "default.nix")
    || (type == "directory" && builtins.pathExists (dir + "/${name}/default.nix"));
in
  lib.mapAttrsToList (name: _: dir + "/${name}") (lib.filterAttrs importable entries)
