{ pkgs, inputs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];
  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
    wayland = true;
    enabledExtensions = with spicePkgs.extensions; [
      adblockify
      hidePodcasts
      shuffle
      simpleBeautifulLyrics
      beautifulLyrics
      betterGenres
      fullAlbumDate
      goToSong
      history
      savePlaylists
      copyLyrics
      fullAppDisplay
      powerBar
    ];
  };
}
