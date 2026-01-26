{ ... }:

{
  programs.neovim = {
    initLua = ''
      -- Keybindings Helper Function
      local keymap = vim.keymap.set

      -- ============================================================================
      -- GENERAL KEYBINDINGS
      -- ============================================================================

      -- Clear search highlighting with Escape
      keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

      -- Better window navigation
      keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
      keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
      keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
      keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

      -- Resize windows with arrows
      keymap("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
      keymap("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
      keymap("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
      keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

      -- Buffer navigation
      keymap("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
      keymap("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
      keymap("n", "<leader>x", "<cmd>bdelete<CR>", { desc = "Close buffer" })

      -- Move text up and down in Visual mode
      keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
      keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })

      -- Stay in indent mode when indenting in Visual mode
      keymap("v", "<", "<gv", { desc = "Indent left" })
      keymap("v", ">", ">gv", { desc = "Indent right" })

      -- Better paste (doesn't replace clipboard with deleted text)
      keymap("v", "p", '"_dP', { desc = "Paste without yanking" })

      -- Keep cursor centered when scrolling
      keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
      keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
      keymap("n", "n", "nzzzv", { desc = "Next search result (centered)" })
      keymap("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

      -- ============================================================================
      -- LEADER KEY SHORTCUTS (Space + key)
      -- ============================================================================

      -- File operations
      keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
      keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
      keymap("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit all without saving" })

      -- Split windows
      keymap("n", "<leader>sv", "<cmd>vsplit<CR>", { desc = "Split vertically" })
      keymap("n", "<leader>sh", "<cmd>split<CR>", { desc = "Split horizontally" })
      keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
      keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

      -- Tabs
      keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
      keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
      keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
      keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
    '';
  };
}
