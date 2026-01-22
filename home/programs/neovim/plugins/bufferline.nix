{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = bufferline-nvim;
        type = "lua";
        config = ''
          require("bufferline").setup({
            options = {
              mode = "buffers",
              themable = true,
              numbers = "none",
              close_command = "bdelete! %d",
              right_mouse_command = "bdelete! %d",
              left_mouse_command = "buffer %d",
              middle_mouse_command = nil,
              indicator = {
                icon = "▎",
                style = "icon",
              },
              buffer_close_icon = "󰅖",
              modified_icon = "●",
              close_icon = "",
              left_trunc_marker = "",
              right_trunc_marker = "",
              max_name_length = 18,
              max_prefix_length = 15,
              truncate_names = true,
              tab_size = 18,
              diagnostics = "nvim_lsp",
              diagnostics_update_in_insert = false,
              diagnostics_indicator = function(count, level)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
              end,
              offsets = {
                {
                  filetype = "NvimTree",
                  text = "File Explorer",
                  text_align = "center",
                  separator = true,
                },
              },
              color_icons = true,
              show_buffer_icons = true,
              show_buffer_close_icons = true,
              show_close_icon = true,
              show_tab_indicators = true,
              persist_buffer_sort = true,
              separator_style = "thin",
              enforce_regular_tabs = false,
              always_show_bufferline = true,
              sort_by = "id",
            },
          })

          -- Buffer navigation keybindings
          local keymap = vim.keymap.set
          keymap("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", { desc = "Pin/unpin buffer" })
          keymap("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Delete non-pinned buffers" })
          keymap("n", "<leader>bo", "<cmd>BufferLineCloseOthers<CR>", { desc = "Delete other buffers" })
          keymap("n", "<leader>br", "<cmd>BufferLineCloseRight<CR>", { desc = "Delete buffers to the right" })
          keymap("n", "<leader>bl", "<cmd>BufferLineCloseLeft<CR>", { desc = "Delete buffers to the left" })
          
          -- Navigate buffers with Tab and Shift+Tab
          keymap("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
          keymap("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
        '';
      }
    ];
  };
}
