host := "wasabi"

# Default

default:
    @just --list

# Checks

check:
    nix flake check

dry:
    sudo nixos-rebuild dry-build --flake .#{{host}}

# Build / Deploy

build:
    nix build .#nixosConfigurations.{{host}}.config.system.build.toplevel --print-build-logs

switch:
    sudo nixos-rebuild switch --flake .#{{host}}

test:
    sudo nixos-rebuild test --flake .#{{host}}

boot:
    sudo nixos-rebuild boot --flake .#{{host}}

rollback:
    sudo nixos-rebuild switch --rollback

# Updates

update:
    nix flake update
    @echo "Review with: git diff flake.lock"

update-input input:
    nix flake lock --update-input {{input}}

# Cleanup

gc:
    sudo nix-collect-garbage --delete-older-than 30d
    sudo nix-store --optimise

gc-all:
    sudo nix-collect-garbage -d
    sudo nix-store --optimise

clean:
    rm -f result result-*

# Generations

generations:
    sudo nix-env --profile /nix/var/nix/profiles/system --list-generations

delete-old-generations:
    sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old

# Formatting

fmt:
    alejandra .

# Assets

assets-pull:
    git -C ~/.local/share/assets pull --ff-only

assets-status:
    git -C ~/.local/share/assets status
    git -C ~/.local/share/assets log -1 --oneline

clean-all:
    sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old
    sudo nix-collect-garbage -d
    sudo nix-store --optimise
    rm -f result result-*
