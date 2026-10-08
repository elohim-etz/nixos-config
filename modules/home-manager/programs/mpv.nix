{
  config,
  pkgs,
  ...
}: {
  # home.file."Pictures/Screenshots/Mpv/.keep".text = "";
  programs.mpv = {
    enable = true;
    scripts = [pkgs.mpvScripts.mpris];
    config = {
      gpu-api = "opengl";
      vo = "gpu";
      gpu-context = "wayland";
      hwdec = "vaapi";
      hwdec-codecs = "all";
      cache = "yes";
      cache-on-disk = "yes";
      demuxer-max-bytes = "500M";
      demuxer-max-back-bytes = "100M";
      audio-channels = "auto";
      volume-max = 150;
      sub-auto = "fuzzy";
      sub-font-size = 42;
      ytdl = "yes";
      screenshot-directory = "${config.home.homeDirectory}/Pictures/Screenshots/Mpv";
    };
    bindings = {
      # Seeking
      "h" = "seek -10";
      "l" = "seek 10";
      "j" = "seek -30";
      "k" = "seek 30";

      # Fine seeking
      "H" = "seek -1";
      "L" = "seek 1";

      # Playback
      "space" = "cycle pause";
      "q" = "quit";
      "Q" = "quit-watch-later";

      # Volume
      "+" = "add volume 5";
      "=" = "add volume 5";
      "-" = "add volume -5";

      # Playback speed
      "[" = "multiply speed 0.9091";
      "]" = "multiply speed 1.1";
      "\\" = "set speed 1.0";

      # Subtitles
      "c" = "cycle sub";
      "C" = "cycle sub down";
      "z" = "add sub-delay -0.1";
      "x" = "add sub-delay 0.1";
      "Z" = "add sub-delay -1";
      "X" = "add sub-delay 1";

      # Audio
      "a" = "cycle audio";

      # Video
      "f" = "cycle fullscreen";
      "m" = "cycle mute";

      # Screenshots
      "s" = "screenshot video";
      "S" = "screenshot window";

      # Playback position
      "0" = "seek 0 absolute";
      "g" = "seek 0 absolute";
      "G" = "seek 100 absolute";

      # Chapters
      "{" = "add chapter -1";
      "}" = "add chapter 1";

      # OSD
      "i" = "script-binding stats/display-stats";
    };
  };
}
