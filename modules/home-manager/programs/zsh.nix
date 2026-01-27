{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    
    history = {
      size = 50000;
      save = 50000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
      ignoreSpace = true;
      extended = true;
      share = true;
    };

    historySubstringSearch.enable = true;

    autocd = true;
    
    defaultKeymap = "emacs";

    syntaxHighlighting.enable = true;
    
    autosuggestion.enable = true;
    
    enableCompletion = true;
    
    completionInit = ''
      autoload -Uz compinit
      compinit -d "''${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump"
    '';

    initContent = ''
      setopt AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT
      setopt CORRECT
      setopt NO_BEEP
      setopt INTERACTIVE_COMMENTS
      setopt COMPLETE_IN_WORD
      setopt HIST_REDUCE_BLANKS HIST_VERIFY
      
      zstyle ':completion:*' matcher-list "" \
        'm:{a-zA-Z}={A-Za-z}' \
        'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-zA-Z}={A-Za-z}' \
        'r:|=* m:{a-zA-Z}={A-Za-z}'
      
      export GPG_TTY=$(tty)
      
      extract() {
        if [ -f "$1" ]; then
          case "$1" in
            *.tar.bz2)   tar xjf "$1" ;;
            *.tar.gz)    tar xzf "$1" ;;
            *.bz2)       bunzip2 "$1" ;;
            *.rar)       unrar x "$1" ;;
            *.gz)        gunzip "$1" ;;
            *.tar)       tar xf "$1" ;;
            *.tbz2)      tar xjf "$1" ;;
            *.tgz)       tar xzf "$1" ;;
            *.zip)       unzip "$1" ;;
            *.Z)         uncompress "$1" ;;
            *.7z)        7z x "$1" ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
          esac
        else
          echo "'$1' is not a valid file"
        fi
      }
    '';

    shellAliases = {
      ls = "ls --color=auto --group-directories-first";
      la = "ls -A";
      ll = "ls -lh";
      lla = "ls -lAh";
      
      ".." = "cd ..";
      "..." = "cd ../..";
      
      grep = "grep --color=auto";
      df = "df -h";
      du = "du -h";
      clr = "clear";
      svim = "sudo nvim";
      
      rebuild = "sudo nixos-rebuild switch --flake";
      code = "codium";
    };

    plugins = [
      {
        name = "fzf-tab";
        src = pkgs.fetchFromGitHub {
          owner = "Aloxaf";
          repo = "fzf-tab";
          rev = "v1.1.2";
          sha256 = "sha256-Qv8zAiMtrr67CbLRrFjGaPzFZcOiMVEFLg1Z+N6VMhg=";
        };
      }
      {
        name = "zsh-z";
        src = pkgs.fetchFromGitHub {
          owner = "agkozak";
          repo = "zsh-z";
          rev = "afaf2965b41fdc6ca66066e09382726aa0b6aa04";
          sha256 = "sha256-FnGjp/VJLPR6FaODY0GtCwcsTYA4d6D8a6dMmNpXQ+g=";
        };
      }
    ];

    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      PAGER = "less";
      LESS = "-R";
      TERM = "xterm-256color";
    };
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
