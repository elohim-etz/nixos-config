{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-tree-lua;
        type = "lua";
        config = ''
          -- Disable netrw (Vim's default file explorer)
          vim.g.loaded_netrw = 1
          vim.g.loaded_netrwPlugin = 1

          require("nvim-tree").setup({
            view = {
              width = 35,
              side = "left",
            },
            renderer = {
              group_empty = true,
              icons = {
                show = {
                  file = true,
                  folder = true,
                  folder_arrow = true,
                  git = true,
                },
              },
            },
            filters = {
              dotfiles = false,
              custom = { ".git", "node_modules", ".cache" },
            },
            git = {
              enable = true,
              ignore = false,
            },
            actions = {
              open_file = {
                quit_on_open = false,
              },
            },
          })

          -- Keybindings
          local keymap = vim.keymap.set
          keymap("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
          keymap("n", "<leader>ef", "<cmd>NvimTreeFindFile<CR>", { desc = "Find current file in explorer" })
          keymap("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
          keymap("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
        '';
      }
    ];
  };
}
