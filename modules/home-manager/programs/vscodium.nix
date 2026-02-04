{ config, pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
        esbenp.prettier-vscode
        jnoortheen.nix-ide
      ];

      userSettings = {
        "workbench.colorTheme" = "Catppuccin Mocha";
        "window.menuBarVisibility" = "toggle";
        "editor.fontSize" = 16;
        "editor.scrollbar.vertical" = "hidden";
        "editor.scrollbar.verticalScrollbarSize" = 0;
        "editor.wordWrap"= "on";

        "security.workspace.trust.untrustedFiles" = "newWindow";
        "security.workspace.trust.startupPrompt" = "never";
        "security.workspace.trust.enabled" = false;

        "editor.minimap.side" = "left";
        "editor.minimap.maxColumn" = 60;
        "editor.fontFamily" = "'JetbrainsMono Nerd Font','Maple Mono', monospace";

        "extensions.autoUpdate" = false;
        "workbench.statusBar.visible" = false;

        "files.insertFinalNewline" = true;

        "terminal.external.linuxExec" = "kitty";
        "terminal.explorerKind" = "both";
        "terminal.sourceControlRepositoriesKind" = "both";

        "telemetry.telemetryLevel" = "off";

        "workbench.activityBar.location" = "top";
        "window.customTitleBarVisibility" = "auto";
        "workbench.sideBar.location" = "right";
        "workbench.iconTheme" = "catppuccin-mocha";
        "workbench.secondarySideBar.defaultVisibility" = "hidden";

        "notebook.defaultFormatter" = "esbenp.prettier-vscode";

        "scm.compactFolders" = false;

        "workbench.settings.applyToAllProfiles" = [ ];

        "nix.enableLanguageServer" = true;
        "nix.serverPath" = "nil";
      };

      keybindings = [
        {
          key = "ctrl+v";
          command = "workbench.action.terminal.paste";
          when = "terminalFocus";
        }
        {
          key = "shift shift";
          command = "workbench.action.quickOpen";
        }
        {
          key = "ctrl ctrl";
          command = "workbench.action.showCommands";
        }
      ];
    };
  };
}
