{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = gitsigns-nvim;
        type = "lua";
        config = ''
          require("gitsigns").setup({
            signs = {
              add = { text = "│" },
              change = { text = "│" },
              delete = { text = "_" },
              topdelete = { text = "‾" },
              changedelete = { text = "~" },
              untracked = { text = "┆" },
            },
            signcolumn = true,
            numhl = false,
            linehl = false,
            word_diff = false,
            watch_gitdir = {
              follow_files = true,
            },
            attach_to_untracked = true,
            current_line_blame = true, -- Show git blame inline
            current_line_blame_opts = {
              virt_text = true,
              virt_text_pos = "eol",
              delay = 500,
            },
            on_attach = function(bufnr)
              local gs = package.loaded.gitsigns
              local keymap = vim.keymap.set

              -- Navigation
              keymap("n", "]c", function()
                if vim.wo.diff then return "]c" end
                vim.schedule(function() gs.next_hunk() end)
                return "<Ignore>"
              end, { expr = true, buffer = bufnr, desc = "Next git change" })

              keymap("n", "[c", function()
                if vim.wo.diff then return "[c" end
                vim.schedule(function() gs.prev_hunk() end)
                return "<Ignore>"
              end, { expr = true, buffer = bufnr, desc = "Previous git change" })

              -- Actions
              keymap("n", "<leader>hs", gs.stage_hunk, { buffer = bufnr, desc = "Stage hunk" })
              keymap("n", "<leader>hr", gs.reset_hunk, { buffer = bufnr, desc = "Reset hunk" })
              keymap("n", "<leader>hu", gs.undo_stage_hunk, { buffer = bufnr, desc = "Undo stage hunk" })
              keymap("n", "<leader>hp", gs.preview_hunk, { buffer = bufnr, desc = "Preview hunk" })
              keymap("n", "<leader>hb", function() gs.blame_line({ full = true }) end, { buffer = bufnr, desc = "Blame line" })
              keymap("n", "<leader>hd", gs.diffthis, { buffer = bufnr, desc = "Diff this" })
            end,
          })

          -- Git keybindings in which-key
          require("which-key").add({
            { "<leader>h", group = "Git hunks" },
          })
        '';
      }
    ];
  };
}
