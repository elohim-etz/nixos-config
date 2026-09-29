{
  lib,
  writeShellScriptBin,
  writeText,
  imagemagick,
  rofi,
  awww,
  libnotify,
  coreutils,
  findutils,
  themeColors ? {},
}: let
  # Accepts "#rrggbb" or "rrggbb"; falls back to Catppuccin Mocha.
  col = name: fallback: lib.removePrefix "#" (themeColors.${name} or fallback);

  c = {
    mantle = col "mantle" "181825";
    surface0 = col "surface0" "313244";
    text = col "text" "cdd6f4";
    subtext0 = col "subtext0" "a6adc8";
    lavender = col "lavender" "b4befe";
  };

  # Based on HyDE's Global Selector Style (GPL-3.0, The HyDE Project)
  theme = writeText "wallpaper-picker.rasi" ''
    * {
        main-bg:   #${c.mantle}ff;
        main-fg:   #${c.subtext0}ff;
        select-bg: #${c.surface0}f2;
        select-fg: #${c.lavender}ff;
        accent:    #${c.lavender}99;
    }

    configuration {
        show-icons:            true;
        font:                  "JetBrainsMono Nerd Font 10";
        kb-row-left:           "Left";
        kb-row-right:          "Right";
        kb-move-char-back:     "Control+b";
        kb-move-char-forward:  "Control+f";
    }

    window {
        enabled:          true;
        fullscreen:       false;
        width:            100%;
        location:         center;
        transparency:     "real";
        spacing:          0em;
        padding:          0em;
        border:           0em;
        border-radius:    0em;
        background-color: @main-bg;
    }
    mainbox {
        enabled:          true;
        orientation:      horizontal;
        children:         [ "dummy", "frame", "dummy" ];
        background-color: transparent;
    }
    frame {
        children:         [ "listview" ];
        background-color: transparent;
    }
    dummy {
        width:            2em;
        expand:           false;
        background-color: transparent;
    }

    listview {
        enabled:          true;
        spacing:          2em;
        padding:          4em;
        columns:          5;
        lines:            1;
        dynamic:          false;
        fixed-height:     false;
        fixed-columns:    true;
        reverse:          true;
        cursor:           "default";
        background-color: transparent;
        text-color:       @main-fg;
    }

    element {
        enabled:          true;
        orientation:      vertical;
        spacing:          0.5em;
        padding:          1em;
        border:           1px;
        border-color:     transparent;
        border-radius:    1.5em;
        cursor:           pointer;
        background-color: transparent;
        text-color:       @main-fg;
    }
    element selected.normal {
        background-color: @select-bg;
        border-color:     @accent;
        text-color:       @select-fg;
    }
    element-icon {
        size:             400px;
        expand:           false;
        horizontal-align: 0.5;
        cursor:           inherit;
        background-color: transparent;
        text-color:       inherit;
    }
    element-text {
        vertical-align:   0.5;
        horizontal-align: 0.5;
        padding:          0.5em 0em 0em 0em;
        cursor:           inherit;
        background-color: transparent;
        text-color:       inherit;
    }
  '';
in
  writeShellScriptBin "wallpaper-picker" ''
    export PATH="${coreutils}/bin:${findutils}/bin:$PATH"
    shopt -s nullglob nocaseglob

    WALLPAPER_DIR="''${WALLPAPER_DIR:-$HOME/.local/share/assets/walls}"
    STATE_FILE="$HOME/.cache/current-wallpaper"
    MAX_COLUMNS=5

    ICON_H="''${ICON_H:-400}"
    export THUMB_H=$ICON_H
    export THUMB_W=$((ICON_H * 2 / 3))
    export THUMB_R=$((ICON_H * 7 / 100))

    CACHE_DIR="''${XDG_CACHE_HOME:-$HOME/.cache}/wallpaper-picker/v2-''${THUMB_W}x''${THUMB_H}-r''${THUMB_R}"
    mkdir -p "$CACHE_DIR"

    walls=("$WALLPAPER_DIR"/*.{jpg,jpeg,png,webp,gif})
    if [[ ''${#walls[@]} -eq 0 ]]; then
      ${libnotify}/bin/notify-send "Wallpaper" "No wallpapers found in $WALLPAPER_DIR"
      exit 1
    fi

    thumb_for() { printf '%s' "$CACHE_DIR/''${1//\//_}.png"; }

    # Generate missing/outdated thumbnails in parallel
    for img in "''${walls[@]}"; do
      thumb=$(thumb_for "$img")
      if [[ ! -f $thumb || $img -nt $thumb ]]; then
        printf '%s\0%s\0' "$img" "$thumb"
      fi
    done | xargs -0 -r -n2 -P"$(nproc)" sh -c '
      ${imagemagick}/bin/magick "$1[0]" -auto-orient -strip \
        -thumbnail "''${THUMB_W}x''${THUMB_H}^" -gravity center \
        -extent "''${THUMB_W}x''${THUMB_H}" \
        \( -size "''${THUMB_W}x''${THUMB_H}" xc:black -fill white \
           -draw "roundrectangle 0,0 $((THUMB_W - 1)),$((THUMB_H - 1)) $THUMB_R,$THUMB_R" \) \
        -alpha off -compose CopyOpacity -composite "$2" 2>/dev/null
    ' _

    # Pre-select the current wallpaper
    current=""
    [[ -f $STATE_FILE ]] && current=$(<"$STATE_FILE")
    selected_row=0
    for i in "''${!walls[@]}"; do
      [[ ''${walls[i]} == "$current" ]] && selected_row=$i
    done

    columns=''${#walls[@]}
    (( columns > MAX_COLUMNS )) && columns=$MAX_COLUMNS

    choice=$(
      for img in "''${walls[@]}"; do
        name=$(basename "$img")
        printf '%s\0icon\x1f%s\n' "''${name%.*}" "$(thumb_for "$img")"
      done | ${rofi}/bin/rofi -dmenu -i -no-custom -no-config -show-icons \
          -format i -selected-row "$selected_row" -p "" \
          -theme ${theme} \
          -theme-str "listview { columns: $columns; } element-icon { size: ''${ICON_H}px; }"
    )

    [[ -z $choice ]] && exit 0
    original="''${walls[$choice]}"

    ${awww}/bin/awww img "$original" \
      --transition-type grow \
      --transition-pos "0.5,0.5" \
      --transition-duration 0.8 \
      --transition-fps 60

    echo "$original" > "$STATE_FILE"

    ${libnotify}/bin/notify-send "Wallpaper" \
      "$(basename "$original")" \
      -i "$original" \
      -t 2000
  ''
