{
  writeShellScriptBin,
  imagemagick,
  wofi,
  awww,
  libnotify,
}:
writeShellScriptBin "wallpaper-picker" ''
  WALLPAPER_DIR="''${WALLPAPER_DIR:-$HOME/.local/share/assets/walls}"
  CACHE_DIR="$HOME/.cache/wallpaper-picker"
  THUMB_W="320"
  THUMB_H="180"

  mkdir -p "$CACHE_DIR"

  generate_thumbnail() {
    local input="$1"
    local output="$2"
    ${imagemagick}/bin/magick "$input" \
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

  selected=$(generate_menu | ${wofi}/bin/wofi \
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

  ${awww}/bin/awww img "$original" \
    --transition-type grow \
    --transition-pos "0.5,0.5" \
    --transition-duration 0.8 \
    --transition-fps 60

  echo "$original" > "$HOME/.cache/current-wallpaper"

  ${libnotify}/bin/notify-send "Wallpaper" \
    "$(basename "$original")" \
    -i "$original" \
    -t 2000
''
