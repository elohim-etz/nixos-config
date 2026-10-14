<div align="center">

# ❄️ NixOS Configuration

[![NixOS Unstable](https://img.shields.io/badge/NixOS-unstable-blue.svg?style=flat&logo=NixOS&logoColor=white)](https://nixos.org)
[![Nix Flakes](https://img.shields.io/badge/Nix_Flakes-Enabled-informational?style=flat&logo=NixOS&logoColor=white&color=blue)](https://nixos.wiki/wiki/Flakes)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

Personal NixOS configuration using Flakes and Home Manager for declarative system management.

[Structure](#-structure) • [Hosts](#-hosts) • [Features](#-features) • [Custom Packages](#-custom-packages) • [Quick Start](#-quick-start)

</div>

---

## 📖 Overview

A modular NixOS configuration featuring the **Niri** scrollable-tiling Wayland compositor, full Home Manager integration, theming via Catppuccin, and self-built packages (Stremio Linux shell, wallpaper picker). Built for reproducibility and maintainability with automated flake-lock updates through GitHub Actions.

## 🗂️ Structure

```
.
├── flake.nix              # Flake entry point (nixosConfigurations, homeConfigurations, devShells)
├── justfile               # Task runner for build / switch / update / GC
├── hosts/                 # Host-specific configurations
│   └── laptop/            # Main host: configuration, disko disk layout, hardware config
├── modules/               # Reusable option modules
│   ├── nixos/             # System modules: core, desktop, hardware, optimization
│   └── home-manager/      # User modules: niri, waybar, programs, theme, nixvim, zen-beta
├── home/                  # Standalone Home Manager entrypoints
│   ├── home.nix           # HM config used by the nixosConfiguration
│   └── remote/            # Standalone (non-NixOS) home config
├── pkgs/                  # Custom packages & package lists
│   ├── stremio-linux-shell/ , stremio-service/, wallpaper-picker/
│   └── nixos/ , home-manager/   # environment.systemPackages / home.packages lists
├── overlays/              # Nixpkgs overlays for the custom packages
├── lib/                   # Helpers: mkSystem, mkHome, mkDevShell, importAll
├── devshells/             # Development shells (e.g. kompile/K framework)
└── .github/workflows/     # Scheduled flake.lock update + rebuild test
```

## 🖥️ Hosts & Outputs

| Output | Description |
|--------|-------------|
| `nixosConfigurations.laptop` | Primary laptop — Niri + Waybar on Wayland, systemd-boot, CachyOS kernel |
| `homeConfigurations.remote` | Standalone Home Manager setup for non-NixOS machines |
| `devShells.x86_64-linux.kompile` | K Framework / Kompile development shell |

## ✨ Features

### System (`modules/nixos`)
- **Compositor**: Niri (scrollable-tiling Wayland) with SDDM greeter
- **Bootloader**: systemd-boot with the **CachyOS** LTO kernel (`linuxPackages-cachyos-latest-lto-x86_64-v3`)
- **Disk**: declarative partitioning with **Disko** (GPT → 512 M vfat ESP + ext4 root)
- **Audio**: PipeWire ( PulseAudio + ALSA compat, 32-bit support)
- **Graphics**: Intel (i915 early KMS, `intel-media-driver`, VA-API via `iHD`)
- **Other**: Bluetooth, power profiles, ZRAM compression, automatic store optimisation, Cachix binary cache

### Desktop & Programs (`modules/home-manager`)
- **Bar / Launcher**: Waybar, Rofi, Hyprlock, Mako notifications, wlogout
- **Terminal**: Kitty + Zsh + Starship + fzf + tmux
- **Editor**: Neovim via **NixVim** (Catppuccin Mocha, LSP, Treesitter), plus Zed & VSCodium
- **Browsers**: Zen Beta (fully declarative pins/policies/settings) and Brave (Chromium module)
- **Media**: mpv, Spicetify (Spotify), Stremio (custom Linux shell package)
- **Theming**: centralized theme/GTK module, icon & cursor themes, custom wallpaper picker, `awww` daemon fed by an external assets repo (`nixos-assets`, auto-cloned/pulled on activation)

## 📦 Custom Packages

| Package | Purpose |
|---------|---------|
| `stremio-linux-shell` | Stremio packaged to run natively on Linux shells (with out-path patch) |
| `stremio-service` | Stremio as a user service |
| `wallpaper-picker` | Themeable wallpaper picker (colors injected via overlay) |

All exposed through `overlays/` so they are available from `pkgs` everywhere.

## 🚀 Quick Start

### Installation

```bash
git clone https://github.com/elohim-etz/nixos-config
cd nixos-config

# Fresh install (declarative disk layout defined in hosts/laptop/disko.nix)
nixos-install --flake .#laptop

# Existing system
sudo nixos-rebuild switch --flake .#laptop
```

### Daily Usage (just)

The `justfile` wraps common operations (default host: `laptop`):

```bash
just check          # nix flake check
just dry            # dry-build of the system derivation
just switch         # sudo nixos-rebuild switch --flake .#laptop
just rollback       # switch to previous generation
just update         # nix flake update (review flake.lock diff)
just gc             # garbage collect old generations (>30d) + optimise store
just generations    # list system generations
just fmt            # format Nix code with alejandra
```

### Maintenance Automation

`.github/workflows/update-flake-lock.yml` runs daily, updates `flake.lock`,
tests the rebuild, and caches results (Cachix: `naveen-nixos`).

## 📚 References

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world/)
- [Home Manager Docs](https://nix-community.github.io/home-manager/)
- [Niri Wiki](https://niri-wiki.github.io/niri/)

### Inspiration
- [ryan4yin/nix-config](https://github.com/ryan4yin/nix-config)
- [fufexan/dotfiles](https://github.com/fufexan/dotfiles)

## 📝 License

MIT — See [LICENSE](./LICENSE) for details.

---

<div align="center">

**Made with ❄️ NixOS**

</div>
