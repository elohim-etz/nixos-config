{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      plenary-nvim # Required dependency
      {
        plugin = telescope-nvim;
        type = "lua";
        config = ''
          local telescope = require("telescope")
          local actions = require("telescope.actions")

          telescope.setup({
            defaults = {
              prompt_prefix = " 🔍 ",
              selection_caret = " ➜ ",
              path_display = { "truncate" },
              mappings = {
                i = {
                  ["<C-k>"] = actions.move_selection_previous, -- Move up
                  ["<C-j>"] = actions.move_selection_next,     -- Move down
                  ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                },
              },
            },
          })

          -- Keybindings for Telescope
          local keymap = vim.keymap.set
          
          -- Find files
          keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find files" })
          keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Find recent files" })
          
          -- Search text
          keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Find text (grep)" })
          keymap("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", { desc = "Find word under cursor" })
          
          -- Buffers and help
          keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Find buffers" })
          keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Find help" })
          
          -- Git integration
          keymap("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Git commits" })
          keymap("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "Git status" })
        '';
      }
      telescope-fzf-native-nvim # Better sorting
    ];
  };
}
