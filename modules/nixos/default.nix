{ ... }:

{
  imports = [
    ./hardware/audio.nix
    ./hardware/power.nix
    ./hardware/graphics.nix

    ./core/boot.nix
    ./core/networking.nix
    ./core/system.nix
    ./core/users.nix

    ./desktop/fonts.nix
    ./desktop/niri.nix
    ./desktop/sddm.nix
    ./desktop/xdg.nix

    ./hardware/audio.nix
    ./hardware/bluetooth.nix
    ./hardware/graphics.nix
    ./hardware/power.nix

    ./optimization/zram.nix
  ];
}
