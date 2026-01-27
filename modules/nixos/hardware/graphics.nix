{ config, lib, pkgs, ... }:

{
  # Hardware graphics/OpenGL configuration
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    
    extraPackages = with pkgs; [
      intel-media-driver
      intel-vaapi-driver
      libvdpau-va-gl
      intel-compute-runtime
    ];
  };

  # Environment variables for hardware acceleration
  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "iHD";
  };

  # Wayland/Qt environment variables
  environment.variables = {
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };
}
