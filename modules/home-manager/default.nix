{...}: {
  imports = [
    ./nixvim
    ./programs
    ./niri
    ./waybar
    ./theme

    ./assets.nix
    ./packages.nix
    ./xdg.nix
  ];
}
