{ themeColors, ... }:

{
  wayland.windowManager.niri.settings = {
    layout = {
      background-color = "transparent";
      gaps = 1;
      center-focused-column = "never";
      default-column-width.proportion = 1.0;

      struts = {
        left = 0;
        right = 0;
        top = 0;
        bottom = 0;
      };

      focus-ring.off = { };

      border = {
        width = 2;

        active-gradient._props = {
          angle = 45;
          from = "${themeColors.mauve}ff";
          to = "${themeColors.rosewater}ff";
          relative-to = "workspace-view";
        };

        inactive-gradient._props = {
          angle = 45;
          from = "${themeColors.surface1}55";
          to = "${themeColors.base}55";
          relative-to = "workspace-view";
        };

        urgent-gradient._props = {
          angle = 45;
          from = "${themeColors.red}ff";
          to = "${themeColors.maroon}ff";
        };
      };
    };

    overview.zoom = 0.25;
  };
}
