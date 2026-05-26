{
  inputs,
  ...
}:{
  imports = [ 
    inputs.niri.homeModules.niri
    ./settings.nix
    ./theme.nix
    ./keybinds.nix
    ./rules.nix
    ./autostart.nix
  ];
}
