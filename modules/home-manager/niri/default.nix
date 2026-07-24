{
  inputs,
  ...
}: {
  imports = [
    inputs.niri.homeModules.default
    ./settings.nix
    ./theme.nix
    ./keybinds.nix
    ./rules.nix
    ./autostart.nix
    ./blur.nix
  ];

  # niri-nix's home-manager module lives under `wayland.windowManager.niri`
  # (sodiboo's was `programs.niri`). `enable` is what actually makes it write
  # ~/.config/niri/config.kdl and validate it at build time.
  #
  # NOTE: niri itself is still installed/started via the NixOS module
  # (modules/nixos/desktop/niri.nix), same as before. If niri-nix's HM module
  # also tries to install a package or start a systemd user service for niri,
  # that's normally harmless alongside the NixOS module, but if you notice
  # double-start weirdness after switching, that's the first place to look.
  wayland.windowManager.niri.enable = true;
}
