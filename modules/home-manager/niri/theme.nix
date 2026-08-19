_: {
  wayland.windowManager.niri.settings.layout = {
    border = {
      width = 2;

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
      background-effect.blur = true;
    }
  ];
}
