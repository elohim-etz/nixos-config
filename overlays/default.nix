inputs: [
  inputs.nix-cachyos-kernel.overlays.pinned
  (import ./stremio-linux-shell.nix)
  (import ./stremio-service.nix)
  (import ./wallpaper-picker.nix)
]
