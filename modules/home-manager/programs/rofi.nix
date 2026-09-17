{
  pkgs,
  themeColors,
  ...
}: let
  c = builtins.mapAttrs (_: v: "${v}ff") themeColors;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
  };

  xdg.configFile."rofi/config.rasi".text = ''
    /**
     * ROFI Layout
    **/


    // Config //
    configuration {
        modi:                        "drun,filebrowser,window,run";
        show-icons:                  true;
        display-drun:                " ";
        display-run:                 " ";
        display-filebrowser:         " ";
        display-window:              " ";
        drun-display-format:         "{name}";
        window-format:               "{w}{t}";
        font:                        "JetBrainsMono Nerd Font, monospace Bold 10";
        icon-theme:                  "Tela-circle-dracula";
    }

    // Color palette //
    * {
        base:                        ${c.base};
        mantle:                      ${c.mantle};
        crust:                       ${c.crust};
        text:                        ${c.text};
        subtext0:                    ${c.subtext0};
        surface0:                    ${c.surface0};
        surface1:                    ${c.surface1};
        overlay0:                    ${c.overlay0};
        blue:                        ${c.blue};
        lavender:                    ${c.lavender};
        mauve:                       ${c.mauve};
        red:                         ${c.red};
        green:                       ${c.green};

        background-color:            transparent;
        text-color:                  @text;
    }


    // Main //
    window {
        height:                      31em;
        width:                       37em;
        transparency:                "real";
        fullscreen:                  false;
        enabled:                     true;
        cursor:                      "default";
        spacing:                     0em;
        padding:                     0em;
        border:                      2px;
        border-radius:                1.2em;
        border-color:                @lavender;
        background-color:            @base;
    }
    mainbox {
        enabled:                     true;
        spacing:                     0em;
        padding:                     0em;
        orientation:                 horizontal;
        children:                    [ "inputbar" , "mode-switcher" , "listbox" ];
        background-color:            @base;
    }


    // Inputs //
    inputbar {
        width:                       0em;
        enabled:                     true;
        children:                    [ "entry" ];
    }
    entry {
        enabled:                     false;
    }


    // Modes //
    mode-switcher {
        width:                       9em;
        orientation:                 vertical;
        enabled:                     true;
        padding:                     3em 1.8em 3em 1.8em;
        spacing:                     1em;
        background-color:            @mantle;
        border-radius:                1em 0em 0em 1em;
    }
    button {
        font:                       "JetBrainsMono Nerd Font 16";
        padding-left:                8px;
        cursor:                      pointer;
        border-radius:               3em;
        background-color:            @mantle;
        text-color:                  @subtext0;
    }
    button selected {
        border-radius:               3em;
        background-color:            @mauve;
        text-color:                  @crust;
    }


    // Lists //
    listbox {
        padding:                     0em;
        spacing:                     0em;
        orientation:                 vertical;
        children:                    [ "dummy" , "listview" , "dummy" ];
        background-color:            transparent;
    }
    listview {
        padding:                     1em;
        spacing:                     0.3em;
        enabled:                     true;
        columns:                     1;
        lines:                       7;
        cycle:                       true;
        dynamic:                     true;
        scrollbar:                   false;
        layout:                      vertical;
        reverse:                     false;
        expand:                      false;
        fixed-height:                true;
        fixed-columns:               true;
        cursor:                      "default";
        background-color:            transparent;
        text-color:                  @text;
    }
    dummy {
        background-color:            transparent;
    }


    // Elements //
    element {
        orientation:                 horizontal;
        enabled:                     true;
        spacing:                     1.5em;
        padding:                     0.5em;
        cursor:                      pointer;
        background-color:            transparent;
        text-color:                  @text;
        border-radius:                0.6em;
    }
    element normal.normal {
        background-color:            transparent;
        text-color:                  @text;
    }
    element normal.alternate {
        background-color:            transparent;
        text-color:                  @text;
    }
    element selected.normal {
        background-color:            @surface0;
        text-color:                  @lavender;
    }
    element alternate.normal {
        background-color:            transparent;
        text-color:                  @text;
    }
    element-icon {
        size:                        3em;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
    }
    element-text {
        vertical-align:              0.5;
        horizontal-align:            0;
        cursor:                      inherit;
        background-color:            transparent;
        text-color:                  inherit;
        font: "JetBrainsMono Nerd Font, monospace Bold 12";
    }

    // Error message //
    error-message {
        text-color:                  @text;
        background-color:            @base;
        text-transform:              capitalize;
        border-radius:                1em;
        children:                    [ "textbox" ];
    }

    textbox {
        text-color:                  inherit;
        background-color:            inherit;
        vertical-align:              0.5;
        horizontal-align:            0.5;
    }
  '';
}
