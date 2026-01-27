{ config, pkgs, ... }:

{
  programs.brave = {
    enable = true;
    commandLineArgs = [
      "--enable-features=TouchpadOverscrollHistoryNavigation,UseOzonePlatform"
      "--ozone-platform=wayland"
    ];
  };
}
