<div align="center">

# ❄️ nixos-config

Personal NixOS configuration: flakes, Home Manager, a custom-tuned kernel and a CI-backed binary cache.

[![NixOS unstable](https://img.shields.io/badge/NixOS-unstable-5277C3?style=flat&logo=nixos&logoColor=white)](https://nixos.org)
[![Flakes](https://img.shields.io/badge/Nix-Flakes-5277C3?style=flat&logo=nixos&logoColor=white)](https://wiki.nixos.org/wiki/Flakes)
[![CI](https://github.com/elohim-etz/nixos-config/actions/workflows/ci.yml/badge.svg)](https://github.com/elohim-etz/nixos-config/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

[Overview](#overview) · [Stack](#stack) · [Layout](#repository-layout) · [Installation](#installation) · [Usage](#usage) · [Kernel](#custom-kernel) · [CI & cache](#ci-and-binary-cache)

</div>

<!-- Add a screenshot here: ![desktop](./docs/screenshot.png) -->

## Overview

A modular, reproducible setup for a single laptop (`nixos`), built on `nixos-unstable`.

- **Flake-based**: one entry point, pinned inputs, same result on every machine.
- **NixOS + Home Manager** in one rebuild, sharing the same `pkgs`.
- **Overlays** for custom packages, overrides, a stable-channel escape hatch and a configurable kernel.
- **Custom kernel** (`my.kernel`) tuned for the hardware, with a stock-kernel fallback boot entry.
- **CI** builds the kernel and system, pushes to [Cachix](https://naveen-nixos.cachix.org), and opens a nightly `flake.lock` update PR.

## Stack

| Area | Choice |
|---|---|
| Compositor | [niri](https://github.com/YaLTeR/niri) (scrollable tiling, Wayland) |
| Bar / launcher / notifications | Waybar · Rofi · Mako |
| Lock / logout / login | Hyprlock · wlogout · SDDM (astronaut theme) |
| Terminal / shell | Kitty · Zsh · Starship · tmux · Yazi |
| Editors | Neovim via [nixvim](https://github.com/nix-community/nixvim) · VSCodium · Zed |
| Browser | Brave |
| Media | mpv · Spicetify (Spotify) · Stremio |
| Theme | Catppuccin Mocha (shared palette in `modules/home-manager/theme`) · Tela-circle icons · Bibata cursor |
| Fonts | JetBrainsMono / FiraCode Nerd Font · Cantarell · Noto |
| Audio / power | PipeWire · power-profiles-daemon · zram swap |

## Repository layout

```
.
├── flake.nix                  # inputs and outputs
├── lib/
│   ├── default.nix            # mkHost, mkHome, forAllSystems, ownPackages
│   └── import-all.nix         # auto-imports every module in a directory
├── hosts/
│   └── laptop/                # host-specific facts (hardware, hostname, my.kernel)
├── home/
│   └── naveen/
│       ├── laptop.nix         # full desktop profile (used by the NixOS build)
│       └── remote.nix         # minimal CLI profile for servers (standalone HM)
├── modules/
│   ├── nixos/
│   │   ├── core/              # boot, nix settings, networking, users, base packages
│   │   ├── desktop/           # niri, SDDM, fonts, portals
│   │   ├── hardware/          # audio, bluetooth, graphics, power
│   │   ├── kernel/            # the my.kernel options
│   │   └── optimization/      # zram
│   └── home-manager/
│       ├── niri/              # compositor config, binds, rules
│       ├── programs/          # one file per program
│       ├── theme/             # palette, GTK/Qt, cursor, icons
│       ├── waybar/  nixvim/  assets.nix  xdg.nix  packages.nix
├── overlays/                  # additions · modifications · stable · kernel · fixes
├── pkgs/                      # your own derivations (auto-discovered)
├── devshells/                 # `nix develop .#kompile`
├── justfile                   # day-to-day commands
└── .github/                   # CI, nightly lock update, dependabot
```

Every directory with a `default.nix` imports its siblings automatically through `lib/import-all.nix`, so adding a module means adding a file.

## Installation

### On an existing NixOS system

```bash
git clone https://github.com/elohim-etz/nixos-config ~/nixos-config
cd ~/nixos-config
sudo nixos-rebuild switch --flake .#laptop --accept-flake-config
```

`--accept-flake-config` lets Nix use this flake's binary cache (otherwise the custom kernel is compiled locally). After the first switch the cache is configured system-wide.

### On new hardware

1. Boot a NixOS installer and partition/mount your disks (`hosts/laptop/disko.nix` is a reference layout, it is **not** imported).
2. Generate the hardware file and replace `hosts/laptop/hardware-configuration.nix`:
   ```bash
   nixos-generate-config --show-hardware-config > hosts/laptop/hardware-configuration.nix
   ```
3. Review `hosts/laptop/default.nix`, especially `my.kernel.march`, which must match the new CPU.
4. Install: `sudo nixos-install --flake .#laptop --accept-flake-config`

### Servers / non-NixOS (Home Manager only)

```bash
home-manager switch --flake .#remote --impure
```

`--impure` is required: the username and home directory come from `$USER` and `$HOME`, so the same profile works on any machine. Without it the profile falls back to the user `user`.

## Usage

Common tasks are in the [`justfile`](./justfile) (`just` lists all).

| Command | What it does |
|---|---|
| `just check` | `nix flake check` (formatting, statix, deadnix, evaluation) |
| `just dry` | Dry-build the system |
| `just build` | Build the system without activating it |
| `just switch` | Build and activate now |
| `just boot` | Build and activate on next boot (use this for kernel changes) |
| `just test` | Activate without adding a boot entry |
| `just rollback` | Switch back to the previous generation |
| `just update` / `just update-input <name>` | Update all inputs / one input |
| `just fmt` | Format with alejandra |
| `just gc` | Delete generations older than 30 days and optimise the store |

Also available:

```bash
nix develop            # tooling for this repo (alejandra, statix, deadnix, nixd, nix-update, cachix, nh)
nix develop .#kompile  # native build environment (C/C++, Rust, Python)
nix fmt                # formatter
```

## Custom kernel

The kernel is built from nixpkgs' `linux_latest` and tuned through `my.kernel` in `hosts/laptop/default.nix`. Only the options you set are changed; the rest of nixpkgs' configuration and patches stay.

```nix
my.kernel = {
  enable = true;
  march = "x86-64-v3";   # compiler target; never "native" (CI builds it, on another CPU)
  preempt = "lazy";      # none | voluntary | full | lazy
  hz = 250;              # 100 | 250 | 300 | 1000
  # scx = { enable = true; scheduler = "scx_lavd"; };
};
```

| Option | Default | Purpose |
|---|---|---|
| `enable` | `false` | Use the custom kernel |
| `base` | `linuxPackages_latest.kernel` | Kernel to customise (mainline family) |
| `hz`, `preempt`, `march` | `1000`, `"full"`, `null` | Timer frequency, preemption model, `-march` target |
| `schedExt`, `scx.*` | `true`, off | sched_ext support and an optional userspace scheduler |
| `tcpBbr` | `true` | BBR congestion control and `fq` qdisc |
| `structuredExtraConfig` | `{}` | Any extra Kconfig option (`with lib.kernel; { X = yes; }`) |
| `extraPatches`, `extraMakeFlags` | `[]` | Kernel patches and make flags |
| `strict` | `true` | Fail the build on unknown/unapplied options |
| `stockFallback` | `true` | Add a `stock-kernel` boot entry with the unmodified kernel |

**Workflow.** Any kernel change recompiles the kernel, which is slow on a laptop. Push the change, let CI build and cache it, pull, then `just boot`. If something misbehaves, choose `stock-kernel` in the boot menu.

**Verify** what you are running:

```bash
readlink -f /run/booted-system/kernel                              # differs from the line below
readlink -f /run/current-system/specialisation/stock-kernel/kernel
zcat /proc/config.gz | grep -E '^CONFIG_(PREEMPT_LAZY|HZ=)'
```

## Overlays and packages

| Overlay | Purpose |
|---|---|
| `additions` | Exposes every `pkgs/<name>/package.nix` as `pkgs.<name>` and warns when nixpkgs gains the same package |
| `modifications` | Overrides of existing nixpkgs packages (icon theme, SDDM theme, ...) |
| `stable` | `pkgs.stable.<name>`, to take one package from the stable channel |
| `kernel` | `pkgs.mkCustomKernel`, used by `my.kernel` |
| `fixes` | Temporary patches and pins; keep this one short |

Add a package by creating `pkgs/<name>/package.nix`. It is picked up automatically and built by CI.

## CI and binary cache

| Workflow | Trigger | Does |
|---|---|---|
| `ci.yml` | push to `main`, pull requests | `nix flake check`, then builds the kernel and the system and pushes them to Cachix |
| `update-flake-lock.yml` | nightly, manual | Updates `flake.lock`, builds everything, and on `main` opens a PR |

Cache: `https://naveen-nixos.cachix.org`, public key
`naveen-nixos.cachix.org-1:T8g4TIX4n9FEEFlR3BjOS+QOKN2mLFUhQ0uMBFG87Jk=`

For the cache to help, pull a commit whose lock CI has already built (merge the nightly PR, then rebuild). Check a build will be fetched, not compiled:

```bash
nix build .#nixosConfigurations.laptop.config.boot.kernelPackages.kernel --dry-run
```

Required repository settings: variable `CACHIX_CACHE_NAME` and secret `CACHIX_AUTH_TOKEN`.

## Notes

- `system.stateVersion` and `home.stateVersion` are `25.11`; do not change them when upgrading.
- Wallpapers and other assets come from [`elohim-etz/nixos-assets`](https://github.com/elohim-etz/nixos-assets), pinned as a flake input and linked to `~/.local/share/assets`. Update with `nix flake update assets`.
- Hostname is `nixos`; the flake attribute is `laptop`. They are independent.

## Acknowledgements

Built with help from the NixOS and Home Manager communities, and inspired by the layouts of well-known flake setups such as [Misterio77/nix-config](https://github.com/Misterio77/nix-config) and [nix-community/nixvim](https://github.com/nix-community/nixvim).

## License

[MIT](./LICENSE) © 2026 Naveen Singh Bisht
