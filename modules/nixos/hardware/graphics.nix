{pkgs, ...}: {
  # Hardware graphics/OpenGL configuration
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      intel-media-driver
    ];
  };

  # Environment variables for hardware acceleration
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };
}
