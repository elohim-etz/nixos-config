host := "wasabi"
user := "naveen"

# List all available recipes
default:
    @just --list

# --- Iteration / testing ---

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

# --- Deployment ---

switch:
    sudo nixos-rebuild switch --flake .#{{host}}

test-boot:
    sudo nixos-rebuild test --flake .#{{host}}

set-boot:
    sudo nixos-rebuild boot --flake .#{{host}}

rollback:
    sudo nixos-rebuild switch --rollback

# --- Standalone Home Manager generation cleanup ---

hm-generations:
    home-manager generations

hm-gc days="30":
    home-manager expire-generations "-{{days}} days"

hm-remove id:
    home-manager remove-generations {{id}}

assets-pull:
    git -C ~/.local/share/assets pull --ff-only

assets-status:
    git -C ~/.local/share/assets status
    git -C ~/.local/share/assets log -1 --oneline

# --- Maintenance ---

update:
    nix flake update
    @echo "Review flake.lock diff with 'git diff flake.lock' before switching."

update-input input:
    nix flake lock --update-input {{input}}

history:
    nix profile history --profile /nix/var/nix/profiles/system

gc:
    sudo nix-collect-garbage --delete-older-than 30d
    sudo nix-store --optimise

gc-all:
    sudo nix-collect-garbage -d

fmt:
    alejandra .

diff:
    nixos-rebuild dry-activate --flake .#{{host}}
