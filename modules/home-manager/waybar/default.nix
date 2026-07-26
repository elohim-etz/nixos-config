_:
let
  colors = import ./colors.nix;
in
{
  programs.waybar = {
    enable = true;
    settings.mainBar = import ./settings.nix { inherit colors; };
    style = import ./style.nix { inherit colors; };
  };
}
