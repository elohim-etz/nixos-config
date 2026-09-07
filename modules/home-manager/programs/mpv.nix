{
  config,
  pkgs,
  ...
}: {
  home.file."Pictures/Screenshots/Mpv/.keep".text = "";
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
      screenshot-directory = "${config.home.homeDirectory}/Pictures/Screenshot/Mpv";
    };
  };
}
