{
  pkgs,
  themeColors,
  ...
}: let
  c = themeColors;

  fg = color: {fg = color;};
in {
  home.packages = with pkgs; [
    ffmpegthumbnailer
    ffmpeg
    poppler-utils
    imagemagick
    chafa
    p7zip
    unar
    ouch
    jq
    fd
    ripgrep
    fzf
    zoxide
    exiftool
  ];

  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    shellWrapperName = "y";

    plugins = with pkgs.yaziPlugins; {
      full-border = {
        package = full-border;
        setup = true;
      };
      git = {
        package = git;
        setup = true;
      };
      smart-enter = smart-enter;
      smart-filter = smart-filter;
      mount = mount;
      chmod = chmod;
      ouch = ouch;
      toggle-pane = toggle-pane;
    };

    settings = {
      mgr = {
        ratio = [1 3 4];
        sort_by = "natural";
        sort_sensitive = false;
        sort_reverse = false;
        sort_dir_first = true;
        sort_translit = false;
        linemode = "size";
        show_hidden = false;
        show_symlink = true;
        scrolloff = 5;
        mouse_events = ["click" "scroll"];
      };

      preview = {
        tab_size = 2;
        max_width = 1200;
        max_height = 1200;
        image_filter = "lanczos3";
        image_quality = 85;
        ueberzug_scale = 1;
        ueberzug_offset = [0 0 0 0];
      };

      opener = {
        edit = [
          {
            run = "nvim %s";
            block = true;
            desc = "Edit";
            for = "unix";
          }
        ];
        open = [
          {
            run = "xdg-open %s";
            desc = "Open";
            for = "linux";
          }
        ];
        reveal = [
          {
            run = ''xdg-open "$(dirname "$1")"'';
            desc = "Reveal";
            for = "linux";
          }
        ];
        extract = [
          {
            run = "ya pub extract --list %s";
            desc = "Extract here";
            for = "unix";
          }
        ];
        play = [
          {
            run = "mpv %s";
            orphan = true;
            desc = "Play";
            for = "unix";
          }
        ];
      };

      open = {
        prepend_rules = [
          {mime = "text/*"; use = "edit";}
          {mime = "image/*"; use = "open";}
          {mime = "video/*"; use = "play";}
          {mime = "audio/*"; use = "play";}
          {mime = "inode/directory"; use = "open";}
          {
            url = "*.{zip,rar,7z,tar,gz,bz2,xz,zst}";
            use = "extract";
          }
          {mime = "application/pdf"; use = "open";}
        ];
      };

      tasks = {
        bizarre_retry = 5;
        image_alloc = 536870912;
        image_bound = [0 0];
        suppress_preload = false;
      };

      plugin = {
        prepend_fetchers = [
          {
            url = "*";
            run = "git";
            group = "git";
          }
          {
            url = "*/";
            run = "git";
            group = "git";
          }
        ];
      };
    };

    keymap = {
      mgr = {
        prepend_keymap = [
          {
            on = ["<Enter>"];
            run = "plugin smart-enter";
            desc = "Enter a dir, open a file, or peek an archive";
          }
          {
            on = ["f"];
            run = "plugin smart-filter";
            desc = "Smart filter";
          }
          {
            on = ["M"];
            run = "plugin mount";
            desc = "Manage mounted drives";
          }
          {
            on = ["c" "m"];
            run = "plugin chmod";
            desc = "Chmod on selected files";
          }
          {
            on = ["E"];
            run = "plugin ouch";
            desc = "Extract archive here";
          }
          {
            on = ["C-z"];
            run = "shell 'cd \"$(zoxide query -i)\" && exit' --interactive --confirm";
            desc = "Jump with zoxide";
          }
          {
            on = ["z" "f"];
            run = "cd \"$(fd --type d --hidden --exclude .git | fzf)\"";
            desc = "Fuzzy jump to a directory";
          }
        ];
        append_keymap = [
          {
            on = ["g" "h"];
            run = "cd ~";
            desc = "Go home";
          }
          {
            on = ["T"];
            run = "plugin toggle-pane max-preview";
            desc = "Maximize/restore preview pane";
          }
        ];
      };

      input = {
        prepend_keymap = [
          {
            on = ["<C-a>"];
            run = "move -999";
            desc = "Move to the start of input";
          }
          {
            on = ["<C-e>"];
            run = "move 999";
            desc = "Move to the end of input";
          }
        ];
      };
    };

    theme = {
      mgr = {
        cwd = fg c.blue;

        find_keyword = {
          fg = c.yellow;
          italic = true;
        };
        find_position = {
          fg = c.pink;
          bg = "reset";
          italic = true;
        };

        marker_copied = {
          fg = c.green;
          bg = c.green;
        };
        marker_cut = {
          fg = c.red;
          bg = c.red;
        };
        marker_marked = {
          fg = c.blue;
          bg = c.blue;
        };
        marker_selected = {
          fg = c.teal;
          bg = c.teal;
        };

        count_copied = {
          fg = c.crust;
          bg = c.green;
        };
        count_cut = {
          fg = c.crust;
          bg = c.red;
        };
        count_selected = {
          fg = c.crust;
          bg = c.teal;
        };

        border_symbol = "│";
        border_style = fg c.surface2;

        syntect_theme = "";
      };

      indicator = {
        parent = {
          fg = c.text;
          bg = c.surface1;
        };
        current = {
          fg = c.text;
          bg = c.surface1;
        };
        preview = {
          fg = c.text;
          bg = c.surface1;
        };
        padding = {
          open = "";
          close = "";
        };
      };

      tabs = {
        active = {
          fg = c.crust;
          bg = c.blue;
          bold = true;
        };
        inactive = {
          fg = c.subtext0;
          bg = c.surface0;
        };
        sep_inner = {
          open = "";
          close = "";
        };
        sep_outer = {
          open = "";
          close = "";
        };
      };

      mode = {
        normal_main = {
          fg = c.crust;
          bg = c.blue;
          bold = true;
        };
        normal_alt = {
          fg = c.blue;
          bg = c.surface1;
        };
        select_main = {
          fg = c.crust;
          bg = c.green;
          bold = true;
        };
        select_alt = {
          fg = c.green;
          bg = c.surface1;
        };
        unset_main = {
          fg = c.crust;
          bg = c.red;
          bold = true;
        };
        unset_alt = {
          fg = c.red;
          bg = c.surface1;
        };
      };

      status = {
        overall = {
          fg = c.text;
          bg = c.mantle;
        };
        sep_left = {
          open = "";
          close = "";
        };
        sep_right = {
          open = "";
          close = "";
        };

        perm_type = fg c.blue;
        perm_read = fg c.yellow;
        perm_write = fg c.red;
        perm_exec = fg c.green;
        perm_sep = fg c.overlay0;

        progress_label = {
          fg = c.text;
          bold = true;
        };
        progress_normal = {
          fg = c.blue;
          bg = c.surface0;
        };
        progress_error = {
          fg = c.red;
          bg = c.surface0;
        };
      };

      which = {
        mask = {bg = c.mantle;};
        cand = fg c.sky;
        rest = fg c.overlay0;
        desc = fg c.mauve;
        separator = "  ";
        separator_style = fg c.surface2;
      };

      confirm = {
        border = fg c.blue;
        title = fg c.blue;
        body = fg c.text;
        list = fg c.text;
        btn_yes = {
          fg = c.crust;
          bg = c.blue;
        };
        btn_no = {
          fg = c.text;
          bg = c.surface0;
        };
      };

      spot = {
        border = fg c.blue;
        title = {
          fg = c.crust;
          bg = c.blue;
        };
        tbl_col = fg c.blue;
        tbl_cell = fg c.text;
      };

      notify = {
        title_info = fg c.green;
        title_warn = fg c.yellow;
        title_error = fg c.red;
        icon_info = "";
        icon_warn = "";
        icon_error = "";
      };

      pick = {
        border = fg c.blue;
        active = fg c.pink;
        inactive = fg c.text;
      };

      input = {
        border = fg c.blue;
        title = fg c.text;
        value = fg c.text;
        selected = {reversed = true;};
      };

      cmp = {
        border = fg c.surface2;
        active = {
          fg = c.blue;
          underline = true;
        };
        inactive = fg c.subtext0;
        icon_file = "";
        icon_folder = "";
        icon_command = "";
      };

      tasks = {
        border = fg c.blue;
        title = fg c.text;
        hovered = {underline = true;};
      };

      help = {
        on = fg c.blue;
        run = fg c.text;
        desc = fg c.subtext0;
        hovered = {
          bg = c.surface1;
          bold = true;
        };
        footer = {
          fg = c.text;
          bg = c.surface0;
        };
      };

      filetype = {
        rules = [
          {
            url = "*";
            is = "orphan";
            fg = c.red;
            bold = true;
          }
          {
            url = "*";
            is = "link";
            fg = c.sky;
          }
          {
            url = "*";
            is = "exec";
            fg = c.green;
          }

          {mime = "image/*"; fg = c.yellow;}
          {mime = "video/*"; fg = c.peach;}
          {mime = "audio/*"; fg = c.peach;}
          {mime = "application/zip"; fg = c.green;}
          {mime = "application/x-tar"; fg = c.green;}
          {mime = "application/x-bzip*"; fg = c.green;}
          {mime = "application/x-7z-compressed"; fg = c.green;}
          {mime = "application/x-rar"; fg = c.green;}
          {mime = "application/x-xz"; fg = c.green;}
          {mime = "application/zstd"; fg = c.green;}
          {mime = "application/pdf"; fg = c.red;}
          {mime = "application/msword"; fg = c.sapphire;}
          {mime = "application/vnd.openxmlformats-officedocument.*"; fg = c.sapphire;}
          {mime = "text/*"; fg = c.text;}
          {mime = "application/json"; fg = c.lavender;}
          {mime = "application/x-yaml"; fg = c.lavender;}

          {url = "*/"; fg = c.blue;}
          {url = "*"; fg = c.text;}
        ];
      };
    };
  };
}
