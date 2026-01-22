{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-treesitter.withAllGrammars;
        type = "lua";
        config = ''
          require("nvim-treesitter").setup({
            -- Automatically install missing parsers when entering buffer
            auto_install = true,

            -- Highlighting
            highlight = {
              enable = true,
              additional_vim_regex_highlighting = false,
            },

            -- Indentation
            indent = {
              enable = true,
            },

            -- Incremental selection
            incremental_selection = {
              enable = true,
              keymaps = {
                init_selection = "<C-space>",
                node_incremental = "<C-space>",
                scope_incremental = false,
                node_decremental = "<bs>",
              },
            },
          })
        '';
      }
    ];
  };
}
