_: {
  programs.niri.settings.layout = {

    border = {
      enable = true;
      width  = 2;

      active.gradient = {
        from        = "#cba6f7ff";
        to          = "#f5e0dcff";
        angle       = 45;
        relative-to = "workspace-view";
      };

      inactive.gradient = {
        from        = "#45475a55";
        to          = "#1e1e2e55";
        angle       = 45;
        relative-to = "workspace-view";
      };

      urgent.gradient = {
        from  = "#f38ba8ff";
        to    = "#eba0acff";
        angle = 45;
      };
    };

    shadow = {
      enable         = true;
      softness       = 20;
      spread         = 2;
      offset.x       = 0;
      offset.y       = 4;
      color          = "#cba6f740";
      inactive-color = "#11111b60";
    };

  };

  programs.niri.settings.window-rules = [
    {
      matches  = [{ is-active = false; }];
      opacity  = 0.95;
    }
  ];
}
