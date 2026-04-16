{ ... }:
{

  xdg.dataFile."applications/com.ayugram.desktop.desktop".text = ''
    [Desktop Entry]
    Name=AyuGram Desktop
    Comment=Desktop version of AyuGram - ToS breaking Telegram client
    TryExec=/home/naveen/.nix-profile/bin/AyuGram
    Exec=env DESKTOPINTEGRATION=1 /home/naveen/.nix-profile/bin/AyuGram -- %U
    Icon=com.ayugram.desktop
    Terminal=false
    StartupWMClass=AyuGram
    Type=Application
    Categories=Chat;Network;InstantMessaging;Qt;
    MimeType=x-scheme-handler/tg;x-scheme-handler/tonsite;
    Keywords=tg;chat;im;messaging;messenger;sms;telegram;tdesktop;
    Actions=quit;
    SingleMainWindow=true
    X-GNOME-UsesNotifications=true
  
    [Desktop Action quit]
    Exec=/home/naveen/.nix-profile/bin/AyuGram -quit
    Name=Quit AyuGram
    Icon=application-exit
  '';

  xdg.dataFile."applications/satty.desktop".text = ''
    [Desktop Entry]
    Name=Satty
    Exec=satty -f %f
    Terminal=false
    NoDisplay=false
    Type=Application
    Icon=satty
    Categories=Utility;Graphics;
    MimeType=image/png;image/jpeg;image/webp;image/gif;image/bmp;image/tiff;image/avif;image/svg+xml;
  '';

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Images
      "image/png"                = [ "satty.desktop" "brave-browser.desktop" ];
      "image/jpeg"               = [ "satty.desktop" "brave-browser.desktop" ];
      "image/webp"               = [ "satty.desktop" "brave-browser.desktop" ];
      "image/gif"                = [ "satty.desktop" "brave-browser.desktop" ];
      "image/bmp"                = [ "satty.desktop" "brave-browser.desktop" ];
      "image/tiff"               = [ "satty.desktop" "brave-browser.desktop" ];
      "image/avif"               = [ "satty.desktop" "brave-browser.desktop" ];
      "image/svg+xml"            = [ "brave-browser.desktop" ];

      # Video
      "video/mp4"                = [ "mpv.desktop" ];
      "video/mkv"                = [ "mpv.desktop" ];
      "video/x-matroska"         = [ "mpv.desktop" ];
      "video/webm"               = [ "mpv.desktop" ];
      "video/avi"                = [ "mpv.desktop" ];
      "video/quicktime"          = [ "mpv.desktop" ];
      "video/x-flv"              = [ "mpv.desktop" ];
      "video/mpeg"               = [ "mpv.desktop" ];
      "video/x-ms-wmv"           = [ "mpv.desktop" ];

      # Audio
      "audio/mpeg"               = [ "mpv.desktop" ];
      "audio/flac"               = [ "mpv.desktop" ];
      "audio/ogg"                = [ "mpv.desktop" ];
      "audio/wav"                = [ "mpv.desktop" ];
      "audio/x-wav"              = [ "mpv.desktop" ];
      "audio/aac"                = [ "mpv.desktop" ];
      "audio/opus"               = [ "mpv.desktop" ];
      "audio/mp4"                = [ "mpv.desktop" ];

      # PDF
      "application/pdf"          = [ "brave-browser.desktop" ];

      # Text / Code
      "text/plain"               = [ "dev.zed.Zed.desktop" ];
      "text/markdown"            = [ "dev.zed.Zed.desktop" ];
      "text/html"                = [ "zen-beta.desktop" "brave-browser.desktop" ];
      "text/css"                 = [ "dev.zed.Zed.desktop" ];
      "text/javascript"          = [ "dev.zed.Zed.desktop" ];
      "application/json"         = [ "dev.zed.Zed.desktop" ];
      "application/javascript"   = [ "dev.zed.Zed.desktop" ];

      # Archives
      "application/zip"          = [ "org.gnome.Nautilus.desktop" ];
      "application/x-tar"        = [ "org.gnome.Nautilus.desktop" ];
      "application/x-bzip2"      = [ "org.gnome.Nautilus.desktop" ];
      "application/gzip"         = [ "org.gnome.Nautilus.desktop" ];
      "application/x-7z-compressed" = [ "org.gnome.Nautilus.desktop" ];
      "application/x-rar"        = [ "org.gnome.Nautilus.desktop" ];

      # Web
      "x-scheme-handler/http"    = [ "zen-beta.desktop" "brave-browser.desktop" ];
      "x-scheme-handler/https"   = [ "zen-beta.desktop" "brave-browser.desktop" ];
      "x-scheme-handler/ftp"     = [ "zen-beta.desktop" "brave-browser.desktop" ];
    };
  };

  xdg.configFile."mimeapps.list".force = true;
}
