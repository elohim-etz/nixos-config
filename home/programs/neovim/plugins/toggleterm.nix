{ pkgs, ... }:

{
  programs.neovim = {
    plugins = with pkgs.vimPlugins; [
      {
        plugin = toggleterm-nvim;
        type = "lua";
        config = ''
          require("toggleterm").setup({
            size = function(term)
              if term.direction == "horizontal" then
                return 15
              elseif term.direction == "vertical" then
                return vim.o.columns * 0.4
              end
            end,
            open_mapping = [[<C-\>]],
            hide_numbers = true,
            shade_terminals = true,
            shading_factor = 2,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            persist_mode = true,
            direction = "float",
            close_on_exit = true,
            shell = vim.o.shell,
            auto_scroll = true,
            float_opts = {
              border = "curved",
              winblend = 0,
              highlights = {
                border = "Normal",
                background = "Normal",
              },
            },
          })

          -- Terminal keybindings
          local keymap = vim.keymap.set
          keymap("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Float terminal" })
          keymap("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Horizontal terminal" })
          keymap("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Vertical terminal" })

          -- LazyGit integration
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new({
            cmd = "lazygit",
            dir = "git_dir",
            direction = "float",
            float_opts = {
              border = "curved",
            },
            on_open = function(term)
              vim.cmd("startinsert!")
              vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
            end,
          })

          function _lazygit_toggle()
            lazygit:toggle()
          end

          keymap("n", "<leader>gg", "<cmd>lua _lazygit_toggle()<CR>", { desc = "LazyGit" })

          -- Terminal mode mappings
          function _G.set_terminal_keymaps()
            local opts = {buffer = 0}
            keymap("t", "<esc>", [[<C-\><C-n>]], opts)
            keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
            keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
            keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
            keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
          end

          vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
        '';
      }
    ];
  };
}
