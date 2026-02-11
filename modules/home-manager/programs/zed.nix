{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "catppuccin"
      "catppuccin-icons"
      "nix"
      "rust"
    ];

    userSettings = {
      buffer_font_family = "JetBrainsMono Nerd Font";
      ui_font_family = ".SystemUIFont";
      lsp_document_colors = "inlay";
      tabs = {
        git_status = true;
      };
      disable_ai = true;
      confirm_quit = true;
      project_panel = {
        dock = "right";
        auto_fold_dirs = false;
      };
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      icon_theme = "Catppuccin Mocha";
      ui_font_size = 16;
      buffer_font_size = 15;
      theme = {
        mode = "dark";
        light = "Catppuccin Latte ";
        dark = "Catppuccin Mocha";
      };
      status_bar = {
        "experimental.show" = false;
      };
      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
        selections_menu = false;
      };
      tab_bar = {
        show = true;
      };
      title_bar = {
        show_onboarding_banner = false;
        show_user_picture = false;
        show_sign_in = false;
      };
    };

    userKeymaps = [
      {
        context = "Workspace";
        bindings = {
          "ctrl-b" = "workspace::ToggleRightDock";
          "ctrl-shift-b" = "workspace::ToggleLeftDock";
        };
      }
      {
        context = "Terminal";
        bindings = {
          "ctrl-v" = "terminal::Paste";
        };
      }
    ];
  };
}
