{ pkgs, ... }:

{
  # Import all configuration modules
  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins
    ./lsp.nix
  ];

  # Enable Neovim with custom configuration
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # Additional packages needed for plugins and LSPs
    extraPackages = with pkgs; [
      # LSP servers
      lua-language-server
      nil # Nix LSP
      pyright
      nodePackages.typescript-language-server
      nodePackages.vscode-langservers-extracted # HTML, CSS, JSON, ESLint
      rust-analyzer
      gopls
      
      # Formatters
      stylua
      nixpkgs-fmt
      black
      prettierd
      
      # Tools
      ripgrep # Required for Telescope
      fd # Better find
      lazygit # Git UI
      nodejs # Required for some plugins
      tree-sitter # Syntax highlighting
      
      # Clipboard support
      xclip
      wl-clipboard
    ];
  };
}
