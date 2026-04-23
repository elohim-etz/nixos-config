{
  pkgs,
  inputs,
  ...
}: let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.system};
in {
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify = {
    enable = true;
    wayland = true;
    theme = spicePkgs.themes.default;
    experimentalFeatures = true;
    colorScheme = "custom";

    customColorScheme = {
      text = "FFFFFF";
      subtext = "F1F1F1";
      main = "0F111A";
      sidebar = "0F111A";
      player = "181825";
      card = "00010A";
      shadow = "0F111A";
      selected-row = "F1F1F1";
      button = "FF4151";
      button-active = "F1F1F1";
      button-disabled = "434C5E";
      tab-active = "FF4151";
      notification = "00010A";
      notification-error = "FF4151";
      misc = "00010A";
    };

    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      simpleBeautifulLyrics
      betterGenres
      fullAppDisplay
      showQueueDuration
    ];
  };
}
