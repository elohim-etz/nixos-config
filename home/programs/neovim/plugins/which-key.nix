{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = which-key-nvim;
        type = "lua";
        config = ''
          require("which-key").setup({
            preset = "modern",
            icons = {
              separator = "➜",
              group = "+",
            },
            win = {
              border = "rounded",
            },
            layout = {
              height = { min = 4, max = 25 },
              width = { min = 20, max = 50 },
              spacing = 3,
              align = "center",
            },
          })

          -- Register key groups for better descriptions
          -- This creates the nice categorized menu like LazyVim
          require("which-key").add({
            { "<leader>f", group = "Find (Telescope)" },
            { "<leader>g", group = "Git" },
            { "<leader>s", group = "Split windows" },
            { "<leader>t", group = "Tabs" },
            { "<leader>e", group = "File explorer" },
            { "<leader>l", group = "LSP" },
            { "<leader>d", group = "Diagnostics" },
            { "<leader>c", group = "Code" },
            { "<leader>b", group = "Buffers" },
          })
        '';
      }
    ];
  };
}
