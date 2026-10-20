_final: prev: {
  tela-circle-icon-theme = prev.tela-circle-icon-theme.override {
    circularFolder = false;
    colorVariants = ["dracula"];
  };

  sddm-astronaut = prev.sddm-astronaut.override {
    embeddedTheme = "astronaut";
  };

  # Template for "this package, but patched/with other flags":
  #
  # mpv-unwrapped = prev.mpv-unwrapped.overrideAttrs (old: {
  #   patches = (old.patches or []) ++ [ ./patches/mpv-something.patch ];
  # });
}
