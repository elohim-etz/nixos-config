{
  config,
  pkgs,
  ...
}: {
  programs = {
    zsh = {
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
        export FZF_DEFAULT_OPTS="\
          --style=full \
          --border=rounded \
          --layout=reverse \
          --height=75% \
          --margin=1 \
          --padding=1 \
          --prompt='❯ ' \
          --pointer='▶' \
          --marker='✓' \
          --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
          --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
          --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
          --color=selected-bg:#45475a \
          --color=label:#cdd6f4 \
          --color=input-border:#b4befe \
          --color=list-border:#89b4fa"

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

        export GPG_TTY="$(tty)"

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

        scr() {
          if [[ -z "$1" ]]; then
            echo "Usage: scr <package-id>"
            return 1
          fi
          scrcpy \
            --video-codec=h264 \
            --video-encoder=OMX.MTK.VIDEO.ENCODER.AVC \
            --keyboard=sdk \
            --no-audio \
            --new-display=/200 \
            --flex-display \
            --start-app="$1"
        }

        zstyle ':fzf-tab:*' fzf-flags \
          --style=full \
          --border=rounded \
          --layout=reverse \
          --height=75% \
          --margin=1 \
          --padding=1 \
          --pointer='▶' \
          --marker='✓' \
          --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
          --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
          --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
          --color=selected-bg:#45475a \
          --color=label:#cdd6f4 \
          --color=input-border:#b4befe \
          --color=list-border:#89b4fa
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

        code = "codium";
        zed = "zeditor";

        restart-nextdns = "sudo systemctl restart nextdns.service";

        # scrcpy shortcuts
        "scr-ytm" = "scr com.google.android.apps.youtube.music";
        "scr-tg"  = "scr nu.gpu.nagram";
        "scr-ig"  = "scr com.instagram";
        "scr-yt"  = "scr com.google.android.youtube";
        "scr-wa"  = "scr com.whatsapp";
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
  };
}
