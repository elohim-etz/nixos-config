{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
          require("lualine").setup({
            options = {
              theme = "catppuccin",
              icons_enabled = true,
              component_separators = { left = "", right = "" },
              section_separators = { left = "", right = "" },
              disabled_filetypes = {
                statusline = { "alpha", "dashboard" },
              },
            },
            sections = {
              lualine_a = { "mode" },
              lualine_b = { "branch", "diff", "diagnostics" },
              lualine_c = { { "filename", path = 1 } }, -- Show relative path
              lualine_x = { "encoding", "fileformat", "filetype" },
              lualine_y = { "progress" },
              lualine_z = { "location" },
            },
            inactive_sections = {
              lualine_a = {},
              lualine_b = {},
              lualine_c = { "filename" },
              lualine_x = { "location" },
              lualine_y = {},
              lualine_z = {},
            },
            extensions = { "nvim-tree", "toggleterm" },
          })
        '';
      }
      nvim-web-devicons # Icons for lualine
    ];
  };
}
