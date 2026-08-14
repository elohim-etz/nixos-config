host := "wasabi"
user := "naveen"

# General

default:
    @just --list

# Testing

test-home:
    home-manager build --flake .#{{user}}
    @echo "Build OK -> ./result. Run 'just clean' when done inspecting it."

test-system:
    sudo nixos-rebuild dry-build --flake .#{{host}}

check: test-home test-system
    nix flake check

clean:
    rm -f result result-*

inspect-home path:
    cat result/home-files/{{path}}

diff-home:
    diff -r result/home-files ~ 2>/dev/null || true

preview-home:
    home-manager switch --flake .#{{user}}
    @echo "Previewing live. Run 'just switch' to make it permanent, or 'just switch' anyway later to reconcile."

diff:
    nixos-rebuild dry-activate --flake .#{{host}}

# Deployment

switch:
    sudo nixos-rebuild switch --flake .#{{host}}

test-boot:
    sudo nixos-rebuild test --flake .#{{host}}

set-boot:
    sudo nixos-rebuild boot --flake .#{{host}}

rollback:
    sudo nixos-rebuild switch --rollback

# Generations

nixos-generations:
    sudo nix-env --profile /nix/var/nix/profiles/system --list-generations

nixos-remove-generations:
    sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations old

hm-generations:
    home-manager generations

hm-gc days="30":
    home-manager expire-generations "-{{days}} days"

hm-remove id:
    home-manager remove-generations {{id}}

hm-remove-all:
    home-manager expire-generations "-1 seconds"

hm-clean:
    rm -f ~/.local/state/home-manager/gcroots/current-home
    rm -f ~/.local/state/nix/profiles/home-manager-*-link
    nix-collect-garbage

profile-wipe-history:
    nix profile wipe-history --profile ~/.local/state/nix/profiles/profile

history:
    nix profile history --profile /nix/var/nix/profiles/system

# Maintenance

update:
    nix flake update
    @echo "Review flake.lock diff with 'git diff flake.lock' before switching."

update-input input:
    nix flake lock --update-input {{input}}

gc:
    sudo nix-collect-garbage --delete-older-than 30d
    sudo nix-store --optimise

gc-all:
    sudo nix-collect-garbage -d
    sudo nix-store --optimise

fmt:
    alejandra .

# Assets

assets-pull:
    git -C ~/.local/share/assets pull --ff-only

assets-status:
    git -C ~/.local/share/assets status
    git -C ~/.local/share/assets log -1 --oneline
