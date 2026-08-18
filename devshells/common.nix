{ pkgs, ... }:

{
  packages = with pkgs; [
    # core cli utilities
    git
    curl
    wget
    ripgrep
    fd
    fzf
    jq
    tree
    unzip
    zip

    # system info
    btop
    fastfetch

    # editors
    neovim
  ];

  shellHook = ''
    fastfetch
    echo ""
    echo "→ Entered devshell: $DEVSHELL_NAME"
  '';
}
