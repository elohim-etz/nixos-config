{
  config,
  pkgs,
  inputs,
  ...
}: let
  assetsDir = "${config.xdg.dataHome}/assets";
  setWallpaper = pkgs.writeShellScriptBin "set-wallpaper" ''
    set -eu

    sleep 1

    wallpaper_file="$HOME/.cache/current-wallpaper"
    fallback="${assetsDir}/walls/original-anime-death-stranding.jpg"

    if [ -f "$wallpaper_file" ]; then
      wallpaper="$(<"$wallpaper_file")"
    else
      wallpaper="$fallback"
    fi

    ${pkgs.awww}/bin/awww img "$wallpaper" \
      --transition-type fade \
      --transition-duration 0.5
  '';
in {
  home.packages = [setWallpaper];
  xdg.dataFile."assets".source = inputs.assets;
}
