_: {
  wayland.windowManager.niri.settings.layout = {
    # border is OFF by default in niri (opposite of focus-ring); its mere
    # presence here (without an `off` child) turns it on.
    border = {
      width = 2;

      # Real KDL node names are flat ("active-gradient"), not nested
      # ("active.gradient" like sodiboo's typed option) — from/to/angle/
      # relative-to are all KDL *properties* on that one node, hence _props.
      active-gradient._props = {
        from = "#cba6f7ff";
        to = "#f5e0dcff";
        angle = 45;
        relative-to = "workspace-view";
      };

      inactive-gradient._props = {
        from = "#45475a55";
        to = "#1e1e2e55";
        angle = 45;
        relative-to = "workspace-view";
      };

      urgent-gradient._props = {
        from = "#f38ba8ff";
        to = "#eba0acff";
        angle = 45;
      };
    };

    # shadow is also OFF by default; presence here enables it.
    shadow = {
      softness = 20;
      spread = 2;
      offset._props = {
        x = 0;
        y = 4;
      };
      color = "#cba6f740";
      inactive-color = "#11111b60";
    };
  };

  wayland.windowManager.niri.settings.window-rule = [
    {
      match._props.is-active = false;
      opacity = 0.95;
    }
  ];
}
