{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = indent-blankline-nvim;
        type = "lua";
        config = ''
          require("ibl").setup({
            indent = {
              char = "│",
              tab_char = "│",
            },
            scope = {
              enabled = true,
              show_start = true,
              show_end = false,
              highlight = { "Function", "Label" },
            },
            exclude = {
              filetypes = {
                "help",
                "alpha",
                "dashboard",
                "neo-tree",
                "Trouble",
                "lazy",
                "mason",
                "notify",
                "toggleterm",
                "lazyterm",
              },
            },
          })
        '';
      }
    ];
  };
}
