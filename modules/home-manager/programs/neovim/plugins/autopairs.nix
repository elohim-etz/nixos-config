{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-autopairs;
        type = "lua";
        config = ''
          local autopairs = require("nvim-autopairs")
          local cmp_autopairs = require("nvim-autopairs.completion.cmp")
          local cmp = require("cmp")

          autopairs.setup({
            check_ts = true, -- Treesitter integration
            ts_config = {
              lua = { "string" },
              javascript = { "template_string" },
            },
            fast_wrap = {
              map = "<M-e>",
              chars = { "{", "[", "(", '"', "'" },
              pattern = [=[[%'%"%)%>%]%)%}%,]]=],
              end_key = "$",
              keys = "qwertyuiopzxcvbnmasdfghjkl",
              check_comma = true,
              highlight = "Search",
              highlight_grey = "Comment",
            },
          })

          -- Make autopairs and completion work together
          cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        '';
      }
    ];
  };
}
