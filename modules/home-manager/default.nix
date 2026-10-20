{...}: {
  imports = [
    ./nixvim
    ./programs
    ./niri
    ./waybar
    # ./zen-beta
    ./theme

    ./assets.nix
    ./packages.nix
    ./xdg.nix
  ];
}
