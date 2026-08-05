{ pkgs, ... }: {
  programs.chromium = {
    enable = true;
    package = pkgs.brave-origin;

    commandLineArgs = [
      "--enable-features=AcceleratedVideoEncoder,ParallelDownloading"
    ];
  };
}
