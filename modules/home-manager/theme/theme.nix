_: let
  themes = {
    mocha = import ./themes/mocha.nix;
  };

  activeTheme = "mocha";
  selectedTheme = themes.${activeTheme};
in {
  _module.args = {
    theme = selectedTheme;
    themeColors = selectedTheme.colors;
    themeRgba = selectedTheme.rgba;
  };
}
