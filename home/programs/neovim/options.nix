{ ... }:

{
  programs.neovim = {
    # Lua configuration for Neovim options
    initLua = ''
      -- Leader key (the key you press before shortcuts)
      -- Set it to Space for easy access
      vim.g.mapleader = " "
      vim.g.maplocalleader = " "

      -- Line Numbers
      vim.opt.number = true         -- Show line numbers
      vim.opt.relativenumber = true -- Show relative line numbers (helps with movement)

      -- Indentation
      vim.opt.tabstop = 2           -- Number of spaces a tab counts for
      vim.opt.shiftwidth = 2        -- Number of spaces for auto-indent
      vim.opt.expandtab = true      -- Convert tabs to spaces
      vim.opt.autoindent = true     -- Copy indent from current line when starting new line
      vim.opt.smartindent = true    -- Smart auto-indenting for programming

      -- Search Settings
      vim.opt.ignorecase = true     -- Ignore case when searching
      vim.opt.smartcase = true      -- Unless you type uppercase letters
      vim.opt.hlsearch = true       -- Highlight search results
      vim.opt.incsearch = true      -- Show matches as you type

      -- Appearance
      vim.opt.termguicolors = true  -- Enable 24-bit RGB colors
      vim.opt.background = "dark"   -- Dark background
      vim.opt.signcolumn = "yes"    -- Always show sign column (for git, diagnostics)
      vim.opt.cursorline = true     -- Highlight current line
      vim.opt.wrap = false          -- Don't wrap lines

      -- Behavior
      vim.opt.mouse = "a"           -- Enable mouse support
      vim.opt.clipboard = "unnamedplus" -- Use system clipboard
      vim.opt.undofile = true       -- Enable persistent undo
      vim.opt.updatetime = 250      -- Faster completion
      vim.opt.timeoutlen = 300      -- Faster key sequence completion
      vim.opt.splitright = true     -- Split windows to the right
      vim.opt.splitbelow = true     -- Split windows below

      -- Performance
      vim.opt.lazyredraw = true     -- Don't redraw while executing macros
      vim.opt.synmaxcol = 240       -- Don't syntax highlight super long lines

      -- Backup and Swap
      vim.opt.swapfile = false      -- Don't create swap files
      vim.opt.backup = false        -- Don't create backup files

      -- Completion
      vim.opt.completeopt = { "menu", "menuone", "noselect" }
      vim.opt.pumheight = 10        -- Max items in completion popup

      -- Scroll
      vim.opt.scrolloff = 8         -- Keep 8 lines above/below cursor
      vim.opt.sidescrolloff = 8     -- Keep 8 columns left/right of cursor
    '';
  };
}
