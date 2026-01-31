{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeModules.nixvim
  ];

  programs.nixvim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    
    # Theme
    colorschemes.catppuccin = {
      enable = true;
      settings.flavour = "mocha";
    };
    
    # Options
    opts = {
      number = true;
      relativenumber = true;
      tabstop = 2;
      shiftwidth = 2;
      expandtab = true;
      smartindent = true;
      ignorecase = true;
      smartcase = true;
      termguicolors = true;
      cursorline = true;
      signcolumn = "yes";
      wrap = false;
      scrolloff = 8;
      splitright = true;
      splitbelow = true;
      mouse = "a";
      clipboard = "unnamedplus";
      undofile = true;
      completeopt = "menu,menuone,noselect";
    };
    
    globals.mapleader = " ";
    
    # Essential Plugins
    plugins = {
      # UI
      lualine.enable = true;
      web-devicons.enable = true;
      
      # File navigation
      telescope = {
        enable = true;
        extensions.fzf-native.enable = true;
      };
      
      neo-tree = {
        enable = true;
        settings.close_if_last_window = true;
      };

      noice = {
        enable = true;
        settings = {
          lsp = {
            override = {
              "vim.lsp.util.convert_input_to_markdown_lines" = true;
              "vim.lsp.util.stylize_markdown" = true;
              "cmp.entry.get_documentation" = true;
            };
          };
          presets = {
            bottom_search = true;         # Search bar at bottom
            command_palette = true;       # Command popup in center
            long_message_to_split = true; # Long messages in split
            inc_rename = false;
            lsp_doc_border = true;        # Borders on LSP docs
          };
        };
      };

      bufferline = {
        enable = true;
        settings = {
          options = {
            mode = "buffers";
            numbers = "none";
            close_command = "bdelete! %d";
            right_mouse_command = "bdelete! %d";
            left_mouse_command = "buffer %d";
            separator_style = "thin";
            always_show_bufferline = true;
            diagnostics = "nvim_lsp";
            offsets = [
              {
                filetype = "neo-tree";
                text = "File Explorer";
                text_align = "center";
                separator = true;
              }
            ];
          };
        };
      };
      
      # LSP
      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          rust_analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          ts_ls.enable = true;
          lua_ls.enable = true;
        };
      };
      
      # Completion
      cmp.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      luasnip.enable = true;
      cmp_luasnip.enable = true;
      
      # Treesitter
      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };
      
      # Git
      gitsigns.enable = true;
      
      # Editing
      comment.enable = true;
      nvim-autopairs.enable = true;
      which-key.enable = true;
    };
    
    # Basic Keymaps
    keymaps = [
      # File operations
      { mode = "n"; key = "<leader>w"; action = ":w<CR>"; options.desc = "Save"; }
      { mode = "n"; key = "<leader>q"; action = ":q<CR>"; options.desc = "Quit"; }
      
      # Telescope
      { mode = "n"; key = "<leader>ff"; action = "<cmd>Telescope find_files<cr>"; options.desc = "Find files"; }
      { mode = "n"; key = "<leader>fg"; action = "<cmd>Telescope live_grep<cr>"; options.desc = "Find text"; }
      { mode = "n"; key = "<leader>fb"; action = "<cmd>Telescope buffers<cr>"; options.desc = "Find buffers"; }
      
      # File explorer
      { mode = "n"; key = "<leader>e"; action = "<cmd>Neotree toggle<cr>"; options.desc = "Toggle explorer"; }
      
      # LSP
      { mode = "n"; key = "gd"; action.__raw = "vim.lsp.buf.definition"; options.desc = "Go to definition"; }
      { mode = "n"; key = "K"; action.__raw = "vim.lsp.buf.hover"; options.desc = "Hover"; }
      { mode = "n"; key = "<leader>la"; action.__raw = "vim.lsp.buf.code_action"; options.desc = "Code action"; }
      
      # Buffer navigation  
      { mode = "n"; key = "<S-l>"; action = ":bnext<CR>"; options.desc = "Next buffer"; }
      { mode = "n"; key = "<S-h>"; action = ":bprevious<CR>"; options.desc = "Previous buffer"; }
      
      # Window navigation
      { mode = "n"; key = "<C-h>"; action = "<C-w>h"; options.desc = "Left window"; }
      { mode = "n"; key = "<C-j>"; action = "<C-w>j"; options.desc = "Down window"; }
      { mode = "n"; key = "<C-k>"; action = "<C-w>k"; options.desc = "Up window"; }
      { mode = "n"; key = "<C-l>"; action = "<C-w>l"; options.desc = "Right window"; }
    ];
  };
}
