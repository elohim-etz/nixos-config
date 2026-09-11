{themeColors, ...}: {
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
      "--color=bg+:${themeColors.surface0},bg:${themeColors.base},spinner:${themeColors.rosewater},hl:${themeColors.red}"
      "--color=fg:${themeColors.text},header:${themeColors.red},info:${themeColors.mauve},pointer:${themeColors.rosewater}"
      "--color=marker:${themeColors.rosewater},fg+:${themeColors.text},prompt:${themeColors.mauve},hl+:${themeColors.red}"
      "--color=selected-bg:${themeColors.surface1}"
      "--color=label:${themeColors.text}"
      "--color=input-border:${themeColors.lavender}"
      "--color=list-border:${themeColors.blue}"
    ];
  };
}
