dir:
let
  entries = builtins.readDir dir;

  files = builtins.filter
    (name:
      name != "default.nix"
      && entries.${name} == "regular"
      && builtins.match ".*\\.nix" name != null
    )
    (builtins.attrNames entries);
in
map (name: dir + "/${name}") files
