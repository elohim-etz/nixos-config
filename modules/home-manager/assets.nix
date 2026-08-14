{ config, lib, pkgs, ... }:

let
  assetsDir = "${config.xdg.dataHome}/assets";
  assetsRepo = "https://github.com/elohim-etz/nixos-assets.git";

  setWallpaper = pkgs.writeShellScriptBin "set-wallpaper" ''
    set -eu

    sleep 1

    wallpaper_file="$HOME/.cache/current-wallpaper"
    fallback="${assetsDir}/walls/walls-014.png"

    if [ -f "$wallpaper_file" ]; then
      wallpaper="$(<"$wallpaper_file")"
    else
      wallpaper="$fallback"
    fi

    ${pkgs.awww}/bin/awww img "$wallpaper" \
      --transition-type fade \
      --transition-duration 0.5
  '';
in
{
  home.packages = [
    setWallpaper
  ];

  home.activation.pullAssets = lib.hm.dag.entryAfter ["writeBoundary"] ''
    export GIT_TERMINAL_PROMPT=0
  
    if [ -d "${assetsDir}/.git" ]; then
      $DRY_RUN_CMD ${pkgs.git}/bin/git -C "${assetsDir}" pull --ff-only --quiet $VERBOSE_ARG \
        || echo "pullAssets: pull failed, skipping this run"
    else
      $DRY_RUN_CMD ${pkgs.git}/bin/git clone --quiet --depth 1 "${assetsRepo}" "${assetsDir}" $VERBOSE_ARG \
        || echo "pullAssets: clone failed, skipping this run"
    fi
  '';
}
