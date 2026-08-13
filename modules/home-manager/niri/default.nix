{
  inputs,
  ...
}:

{
  imports =
    [
      inputs.niri.homeModules.default
    ]
    ++ (import ../../../lib/importAll.nix) ./.;

  wayland.windowManager.niri.enable = true;
}
