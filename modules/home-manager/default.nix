{...}: {
  imports = [
    ./nixvim
    ./programs
    ./niri
    ./waybar
    # ./zen-beta
    ./theme

    ./assets.nix
    ./package.nix
    ./xdg.nix
  ];
}
