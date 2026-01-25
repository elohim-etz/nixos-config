<div align="center">

# ❄️ NixOS Configuration

[![NixOS Unstable](https://img.shields.io/badge/NixOS-unstable-blue.svg?style=flat&logo=NixOS&logoColor=white)](https://nixos.org)
[![Nix Flakes](https://img.shields.io/badge/Nix_Flakes-Enabled-informational?style=flat&logo=NixOS&logoColor=white&color=blue)](https://nixos.wiki/wiki/Flakes)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

Personal NixOS configuration using Flakes and Home Manager for declarative system management.

[Structure](#-structure) • [Hosts](#-hosts) • [Features](#-features) • [Quick Start](#-quick-start)

</div>

---

## 📖 Overview

A modular NixOS configuration featuring Niri compositor, comprehensive Home Manager integration, and system-wide declarative package management. Built for reproducibility and maintainability.

## 🗂️ Structure

```
nixos-config/
├── flake.nix                 # Flake entry point
├── flake.lock               
│
├── hosts/                    # Host-specific configurations
│   ├── miso/                 # Primary workstation
│   ├── wasabi/               # Secondary host
│   └── server/               # Server configuration
│
├── modules/                  # System-level modules
│   ├── audio.nix
│   ├── boot.nix
│   ├── fonts.nix
│   ├── graphics.nix
│   ├── networking.nix
│   ├── niri.nix
│   ├── sddm.nix
│   └── zram.nix
│
├── home/                     # Home Manager configuration
│   ├── home.nix
│   ├── modules/             # User-level modules
│   ├── niri/                # Niri compositor config
│   └── programs/            # Application configurations
│       ├── brave/
│       ├── kitty/
│       ├── neovim/
│       ├── spicetify/
│       ├── starship/
│       ├── vscodium/
│       ├── zen/
│       └── zsh/
│
└── assets/                   # Wallpapers and resources
```

## 🖥️ Hosts

| Host | Description | Status |
|------|-------------|--------|
| **miso** | Primary system | 🚧 WIP |
| **wasabi** | Secondary workstation | ✅ Active |
| **server** | Server deployment | 🚧 WIP |

## ✨ Features

### System
- **Compositor**: Niri (Scrollable-tiling Wayland)
- **Display Manager**: SDDM
- **Audio**: PipeWire
- **Boot**: Systemd-boot
- **Disk Management**: Disko for declarative partitioning
- **Memory**: ZRAM compression

### Applications
- **Terminal**: Kitty
- **Shell**: Zsh + Starship
- **Editor**: Neovim (LSP, Treesitter, plugins)
- **Browser**: Brave, Zen
- **Development**: VSCodium, Tmux, Git
- **Media**: MPV, Spotify (Spicetify)
- **System Info**: Fastfetch

## 🚀 Quick Start

### Installation

```bash
# Clone repository
git clone https://github.com/elohim-etz/nixos-config
cd nixos-config

# Fresh install
nixos-install --flake .#wasabi

# Existing system
sudo nixos-rebuild switch --flake .#wasabi
```

### Daily Usage

```bash
# Rebuild system
sudo nixos-rebuild switch --flake .#wasabi

# Update flake inputs
nix flake update

# Garbage collection
sudo nix-collect-garbage -d
```

## 📦 Main Packages

**Desktop**: niri, sddm, kitty, waybar, rofi-wayland  
**Development**: neovim, vscodium, git, tmux, rustup, nodejs  
**Applications**: brave, zen-browser, mpv, spotify, discord  
**Tools**: fastfetch, eza, fd, ripgrep, btop, zoxide

## 📚 References

- [NixOS Manual](https://nixos.org/manual/nixos/stable/)
- [NixOS & Flakes Book](https://nixos-and-flakes.thiscute.world/)
- [Home Manager Docs](https://nix-community.github.io/home-manager/)

### Inspiration
- [ryan4yin/nix-config](https://github.com/ryan4yin/nix-config)
- [fufexan/dotfiles](https://github.com/fufexan/dotfiles)

## 📝 License

MIT - See [LICENSE](./LICENSE) for details.

---

<div align="center">

**Made with ❄️ NixOS**

</div>