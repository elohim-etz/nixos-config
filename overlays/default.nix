inputs: [
  inputs.nix-cachyos-kernel.overlays.pinned
  (import ./stremio-linux-shell.nix)
]
