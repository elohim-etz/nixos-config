{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = alpha-nvim;
        type = "lua";
        config = ''
          local alpha = require("alpha")
          local dashboard = require("alpha.themes.dashboard")

          -- Set header (ASCII art)
          dashboard.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
          }

          -- Set menu
          dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("r", "  Recent files", ":Telescope oldfiles <CR>"),
            dashboard.button("g", "  Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", "  Config", ":e ~/.config/home-manager/neovim/default.nix <CR>"),
            dashboard.button("q", "  Quit", ":qa<CR>"),
          }

          -- Set footer
          local function footer()
            return "🚀 Happy Coding!"
          end

          dashboard.section.footer.val = footer()

          -- Apply colors
          dashboard.section.header.opts.hl = "AlphaHeader"
          dashboard.section.buttons.opts.hl = "AlphaButtons"
          dashboard.section.footer.opts.hl = "AlphaFooter"

          -- Setup
          alpha.setup(dashboard.opts)

          -- Disable folding on alpha buffer
          vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
        '';
      }
    ];
  };
}
