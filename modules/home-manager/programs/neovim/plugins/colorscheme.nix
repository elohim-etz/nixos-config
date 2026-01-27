{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = catppuccin-nvim;
        type = "lua";
        config = ''
          require("catppuccin").setup({
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = {
              light = "latte",
              dark = "mocha",
            },
            transparent_background = false,
            show_end_of_buffer = false,
            term_colors = true,
            dim_inactive = {
              enabled = false,
              shade = "dark",
              percentage = 0.15,
            },
            no_italic = false,
            no_bold = false,
            no_underline = false,
            styles = {
              comments = { "italic" },
              conditionals = { "italic" },
              loops = {},
              functions = {},
              keywords = {},
              strings = {},
              variables = {},
              numbers = {},
              booleans = {},
              properties = {},
              types = {},
              operators = {},
            },
            integrations = {
              cmp = true,
              gitsigns = true,
              nvimtree = true,
              treesitter = true,
              telescope = true,
              which_key = true,
              indent_blankline = {
                enabled = true,
                colored_indent_levels = false,
              },
              native_lsp = {
                enabled = true,
                virtual_text = {
                  errors = { "italic" },
                  hints = { "italic" },
                  warnings = { "italic" },
                  information = { "italic" },
                },
                underlines = {
                  errors = { "underline" },
                  hints = { "underline" },
                  warnings = { "underline" },
                  information = { "underline" },
                },
              },
            },
          })

          -- Load the colorscheme
          vim.cmd.colorscheme("catppuccin")
        '';
      }
    ];
  };
}
