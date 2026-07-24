{ inputs, ... }: {
  imports = [ 
    inputs.niri.homeModules.default
    ./settings.nix
    ./theme.nix
    ./keybinds.nix
    ./rules.nix
    ./autostart.nix
    ./blur.nix
  ];
}
