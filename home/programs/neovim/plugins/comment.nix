{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = comment-nvim;
        type = "lua";
        config = ''
          require("Comment").setup({
            -- Normal mode: gcc to toggle line, gc to toggle with motion
            -- Visual mode: gc to toggle selection
            padding = true,
            sticky = true,
            ignore = "^$", -- Ignore empty lines
            toggler = {
              line = "gcc",  -- Toggle line comment
              block = "gbc", -- Toggle block comment
            },
            opleader = {
              line = "gc",   -- Line comment operator
              block = "gb",  -- Block comment operator
            },
            extra = {
              above = "gcO", -- Add comment above
              below = "gco", -- Add comment below
              eol = "gcA",   -- Add comment at end of line
            },
            mappings = {
              basic = true,
              extra = true,
            },
          })
        '';
      }
    ];
  };
}
