{ pkgs, ... }:

let
  wallpaper-picker = pkgs.writeShellScriptBin "wallpaper-picker" ''
    WALLPAPER_DIR="$HOME/nixos-config/assets/walls"
    CACHE_DIR="$HOME/.cache/wallpaper-picker"
    THUMB_W="320"
    THUMB_H="180"

    mkdir -p "$CACHE_DIR"

    generate_thumbnail() {
      local input="$1"
      local output="$2"
      ${pkgs.imagemagick}/bin/magick "$input" \
        -thumbnail "''${THUMB_W}x''${THUMB_H}^" \
        -gravity center \
        -extent "''${THUMB_W}x''${THUMB_H}" \
        "$output" 2>/dev/null
    }

    generate_menu() {
      for img in "$WALLPAPER_DIR"/*.{jpg,jpeg,png,webp}; do
        [[ -f "$img" ]] || continue
        local base
        base=$(basename "''${img%.*}")
        local thumb="$CACHE_DIR/''${base}.png"
        if [[ ! -f "$thumb" ]] || [[ "$img" -nt "$thumb" ]]; then
          generate_thumbnail "$img" "$thumb"
        fi
        echo -en "img:''${thumb}\x00info:$(basename "$img")\x1f''${img}\n"
      done
    }

    selected=$(generate_menu | ${pkgs.wofi}/bin/wofi \
      --show dmenu \
      --cache-file /dev/null \
      --sort-order=default \
      --conf "$HOME/.config/wofi/wallpaper-picker.conf" \
      --style "$HOME/.config/wofi/wallpaper-picker.css")

    [[ -z "$selected" ]] && exit 0

    # selected is the thumbnail path (img:... stripped by wofi)
    thumb_path="''${selected#img:}"
    base=$(basename "''${thumb_path%.*}")
    original=$(find "$WALLPAPER_DIR" -type f -name "''${base}.*" | head -n1)

    [[ -z "$original" ]] && exit 1

    ${pkgs.awww}/bin/awww img "$original" \
      --transition-type grow \
      --transition-pos "0.5,0.5" \
      --transition-duration 0.8 \
      --transition-fps 60

    echo "$original" > "$HOME/.cache/current-wallpaper"

    ${pkgs.libnotify}/bin/notify-send "Wallpaper" \
      "$(basename "$original")" \
      -i "$original" \
      -t 2000
  '';
in
{
  home.packages = with pkgs; [
    scrcpy
    kitty
    android-tools
    vscodium
    nautilus
    zsh
    spicetify-cli
    starship
    fastfetch
    bat
    satty
    tela-circle-icon-theme
    bibata-cursors
    ayugram-desktop
    tmux
    grim
    slurp
    wl-clipboard
    fzf
    less
    jq
    aria2
    yt-dlp
    ffmpeg
    yazi
    tree
    zip
    zed-editor
    ripgrep
    fd
    lazygit
    awww
    libnotify
    networkmanagerapplet
    stremio-linux-shell
    nil
    imagemagick
    wallpaper-picker
  ];
}
