{inputs}: let
  overlays = {
    stable = import ./stable.nix inputs;
    additions = import ./additions.nix;
    kernel = import ./kernel.nix;
    modifications = import ./modifications.nix;
    fixes = import ./fixes.nix;
  };
  order = ["stable" "additions" "kernel" "modifications" "fixes"];
in
  overlays
  // {
    default = inputs.nixpkgs.lib.composeManyExtensions (map (n: overlays.${n}) order);
  }
