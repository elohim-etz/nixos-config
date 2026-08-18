{
  pkgs,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify = {
    enable = true;
    wayland = true;
    theme = spicePkgs.themes.sleek;
    experimentalFeatures = true;
    colorScheme = "TokyoNight";

    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      spicyLyrics
      hidePodcasts
    ];
  };
}
