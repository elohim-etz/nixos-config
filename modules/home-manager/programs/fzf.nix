{ ... }:
{
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;

    defaultOptions = [
      "--style=full"
      "--border=rounded"
      "--layout=reverse"
      "--height=75%"
      "--margin=1"
      "--padding=1"
      "--prompt=❯ "
      "--pointer=▶"
      "--marker=✓"

      # Catppuccin Mocha
      "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8"
      "--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc"
      "--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
      "--color=selected-bg:#45475a"
      "--color=label:#cdd6f4"
      "--color=input-border:#b4befe"
      "--color=list-border:#89b4fa"
    ];
  };
}
