{themeColors, ...}: {
  programs.waybar = {
    enable = true;
    settings.mainBar = import ./settings.nix {colors = themeColors;};
    style = import ./style.nix {colors = themeColors;};
  };
}
