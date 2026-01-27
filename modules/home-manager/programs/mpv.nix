{ ... }:

{
  programs.mpv = {
    enable = true;

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
    };
  };
}
