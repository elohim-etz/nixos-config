{ inputs, ... }:

let
  lib = import ../../../lib { inherit inputs; };
in
{
  imports = lib.importAll ./.;
}
