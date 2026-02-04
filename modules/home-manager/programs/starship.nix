{ ... }:
{
  programs.starship = {
    enable = true;
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";
      
      add_newline = false;
      continuation_prompt = "▶▶ ";
      
      format = "  $directory$git_branch$git_commit$git_state$git_status $character";
      
      right_format = "$singularity$kubernetes$vcsh$hg_branch$pijul_channel$c$cmake$cobol$daml$dart$deno$dotnet$elixir$elm$erlang$fennel$golang$guix_shell$haskell$haxe$helm$java$julia$kotlin$gradle$lua$nim$nodejs$ocaml$opa$perl$pulumi$purescript$python$raku$rlang$red$ruby$rust$scala$solidity$swift$terraform$vlang$vagrant$zig$buf$conda$meson$spack$nix_shell$memory_usage$aws$gcloud$openstack$azure$custom$cmd_duration$time";
      
      palette = "catppuccin_mocha";
      
      character = {
        success_symbol = "[[󰄛 ](green) ❯](peach)";
        error_symbol = "[[󰄛 ](red) ❯](peach)";
        vimcmd_symbol = "[󰄛  ❮](subtext1)";
      };
      
      directory = {
        truncate_to_repo = false;
        style = "bold lavender";
        format = "[$path]($style)";
      };
      
      git_branch = {
        symbol = "";
        style = "bold mauve";
        format = " on [$symbol $branch(:$hash)]($style)";
      };
      
      git_status = {
        ahead = "⇡\${count}";
        behind = "⇣\${count}";
        diverged = "⇕⇡\${ahead_count}⇣\${behind_count}";
        conflicted = "=\${count}";
        deleted = "✘\${count}";
        modified = "!\${count}";
        renamed = "»\${count}";
        staged = "+\${count}";
        stashed = "$\${count}";
        untracked = "?\${count}";
        format = "([( $all_status$ahead_behind )](bold blue))";
        style = "bold text";
      };
      
      cmd_duration = {
        min_time = 500;
        format = " [$duration]($style)";
        style = "bold yellow";
      };
      
      time = {
        disabled = false;
        format = "[[  $time ](lavender)]($style)";
        time_format = "%R";
        style = "bold lavender";
      };
      
      # Language modules
      nix_shell = {
        format = "[$symbol nix⎪$state⎪]($style) [$name](italic dimmed white)";
        impure_msg = "[⌽](bold dimmed red)";
        pure_msg = "[⌾](bold dimmed green)";
        style = "bold italic dimmed blue";
        symbol = " ";
        unknown_msg = "[◌](bold dimmed yellow)";
      };
      
      deno = {
        format = " [deno](italic) [ ](green bold)";
        version_format = "\${raw}";
      };
      
      lua = {
        format = " [lua](italic) [\${symbol}]($style)";
        style = "bold yellow";
        symbol = "⨀ ";
        version_format = "\${raw}";
      };
      
      nodejs = {
        detect_extensions = [];
        detect_files = ["package-lock.json" "yarn.lock"];
        detect_folders = ["node_modules"];
        format = "[ ](bold green)";
        version_format = "\${raw}";
      };
      
      python = {
        format = "[\${symbol}(\${virtualenv}) \${version}]($style)";
        style = "bold yellow";
        symbol = "[ ](bold blue)";
        version_format = "\${raw}";
      };
      
      ruby = {
        format = " [rb](italic) [\${symbol}]($style)";
        style = "bold red";
        symbol = " ";
        version_format = "\${raw}";
      };
      
      rust = {
        style = "bold red";
        format = " rs(italic) $symbol($style)";
        symbol = " ";
      };
      
      swift = {
        format = " [sw](italic) [\${symbol}]($style)";
        style = "bold red";
        symbol = " ";
        version_format = "\${raw}";
      };
      
      aws = {
        disabled = true;
        format = " [aws](italic) [$symbol $profile $region]($style)";
        style = "bold blue";
        symbol = " ";
      };
      
      buf = {
        style = "bold red";
        format = " [buf](italic) [$symbol $buf_version]($style)";
        symbol = "■ ";
      };
      
      c = {
        style = "bold sapphire";
        format = " [$symbol(-$name)]($style)";
        symbol = "ℂ ";
      };
      
      cpp = {
        style = "bold sapphire";
        format = " [cpp](italic) [\${symbol}]($style)";
        symbol = " ";
      };
      
      kotlin = {
        format = " [kotlin](italic) [\${symbol}]($style)";
        style = "bold red";
        symbol = " ";
      };
      
      ocaml = {
        format = " [ocaml](italic) [\${symbol}]($style)";
        style = "bold yellow";
        symbol = " ";
      };
      
      perl = {
        format = " [perl](italic) [\${symbol}]($style)";
        style = "bold sapphire";
        symbol = " ";
      };
      
      php = {
        format = " [php](italic) [\${symbol}]($style)";
        style = "bold red";
        symbol = " ";
      };
      
      pixi = {
        format = " [pixi](italic) [\${symbol}]($style)";
        style = "bold yellow";
        symbol = "pixi ";
      };
      
      rlang = {
        format = " [rlang](italic) [\${symbol}]($style)";
        style = "bold sapphire";
        symbol = " ";
      };
      
      meson = {
        format = " [meson](italic) [\${symbol}]($style)";
        style = "bold red";
        symbol = "meson ";
      };
      
      conda = {
        style = "bold red";
        format = " conda [$symbol$environment]($style)";
        symbol = "◯ ";
      };
      
      dart = {
        style = "bold sapphire";
        format = " dart [\${symbol}]($style)";
        symbol = " ";
      };
      
      elixir = {
        style = "bold yellow";
        format = " exs [$symbol OTP $otp_version ]($style)";
        symbol = " ";
      };
      
      elm = {
        style = "bold red";
        format = " elm [\${symbol}]($style)";
        symbol = "◩ ";
      };
      
      golang = {
        style = "bold blue";
        format = " go [\${symbol}]($style)";
        symbol = "∩ ";
      };
      
      haskell = {
        style = "bold yellow";
        format = " hs [\${symbol}]($style)";
        symbol = "❯λ ";
      };
      
      java = {
        style = "bold red";
        format = " java [\${symbol}]($style)";
        symbol = " ";
      };
      
      julia = {
        style = "bold sapphire";
        format = " jl [\${symbol}]($style)";
        symbol = "◎ ";
      };
      
      memory_usage = {
        style = "bold sapphire";
        format = " mem [\${ram}( \${swap})]($style)";
        symbol = "▪▫▪ ";
      };
      
      nim = {
        style = "bold yellow";
        format = " nim [\${symbol}]($style)";
        symbol = "▴▲▴ ";
      };
      
      spack = {
        style = "bold yellow";
        format = " spack [\${symbol}\${environment}]($style)";
        symbol = "◇ ";
      };
      
      zig = {
        style = "bold yellow";
        format = " zig [\${symbol}]($style)";
        symbol = " ";
      };
      
      scala = {
        format = " scala [\${symbol}]($style)";
        symbol = " ";
      };
      
      singularity = {
        style = "bold yellow";
        format = " [singularity](italic) [\${symbol}]($style)";
        symbol = "singularity ";
      };
      
      kubernetes = {
        style = "bold sapphire";
        format = " [kubernetes](italic) [\${symbol}]($style)";
        symbol = " ";
      };
      
      vcsh = {
        style = "bold red";
        format = " [vcsh](italic) [\${symbol}]($style)";
        symbol = "vcsh ";
      };
      
      cobol = {
        style = "bold yellow";
        format = " [cobol](italic) [\${symbol}]($style)";
        symbol = "cobol ";
      };
      
      daml = {
        style = "bold sapphire";
        format = " [daml](italic) [\${symbol}]($style)";
        symbol = "daml ";
      };
      
      dotnet = {
        style = "bold red";
        format = " [dotnet](italic) [\${symbol}]($style)";
        symbol = ".NET ";
      };
      
      erlang = {
        style = "bold yellow";
        format = " [erlang](italic) [\${symbol}]($style)";
        symbol = " ";
      };
      
      fennel = {
        style = "bold sapphire";
        format = " [fennel](italic) [\${symbol}]($style)";
        symbol = " ";
      };
      
      haxe = {
        style = "bold red";
        format = " [haxe](italic) [\${symbol}]($style)";
        symbol = " ";
      };
      
      helm = {
        style = "bold yellow";
        format = " [helm](italic) [\${symbol}]($style)";
        symbol = "helm ";
      };
      
      opa = {
        style = "bold sapphire";
        format = " [opa](italic) [\${symbol}]($style)";
        symbol = "opa ";
      };
      
      pulumi = {
        format = " [pulumi](italic) [\${symbol}]($style)";
        style = "bold red";
        symbol = "pulumi ";
      };
      
      purescript = {
        style = "bold yellow";
        format = " [purescript](italic) [\${symbol}]($style)";
        symbol = " ";
      };
      
      raku = {
        style = "bold sapphire";
        format = " [raku](italic) [\${symbol}]($style)";
        symbol = "raku ";
      };
      
      red = {
        style = "bold red";
        format = " [red](italic) [\${symbol}]($style)";
        symbol = "red ";
      };
      
      solidity = {
        style = "bold yellow";
        format = " [solidity](italic) [\${symbol}]($style)";
        symbol = " ";
      };
      
      terraform = {
        style = "bold sapphire";
        format = " [terraform](italic) [\${symbol}]($style)";
        symbol = "terraform ";
      };
      
      vlang = {
        format = " [vlang](italic) [\${symbol}]($style)";
        style = "bold red";
        symbol = "vlang ";
      };
      
      vagrant = {
        format = " [vagrant](italic) [\${symbol}]($style)";
        style = "bold yellow";
        symbol = "vagrant ";
      };
      
      gcloud = {
        format = " [gcloud](italic) [\${symbol}]($style)";
        style = "bold sapphire";
        symbol = "gcloud ";
      };
      
      openstack = {
        format = " [openstack](italic) [\${symbol}]($style)";
        style = "bold red";
        symbol = "openstack ";
      };
      
      azure = {
        format = " [azure](italic) [\${symbol}]($style)";
        style = "bold yellow";
        symbol = " ";
      };
      
      crystal = {
        format = " [crystal](italic) [\${symbol}]($style)";
        style = "bold sapphire";
        symbol = " ";
      };
      
      # Catppuccin Mocha palette
      palettes = {
        catppuccin_mocha = {
          rosewater = "#f5e0dc";
          flamingo = "#f2cdcd";
          pink = "#f5c2e7";
          mauve = "#cba6f7";
          red = "#f38ba8";
          maroon = "#eba0ac";
          peach = "#fab387";
          yellow = "#f9e2af";
          green = "#a6e3a1";
          teal = "#94e2d5";
          sky = "#89dceb";
          sapphire = "#74c7ec";
          blue = "#89b4fa";
          lavender = "#b4befe";
          text = "#cdd6f4";
          subtext1 = "#bac2de";
          subtext0 = "#a6adc8";
          overlay2 = "#9399b2";
          overlay1 = "#7f849c";
          overlay0 = "#6c7086";
          surface2 = "#585b70";
          surface1 = "#45475a";
          surface0 = "#313244";
          base = "#1e1e2e";
          mantle = "#181825";
          crust = "#11111b";
        };
      };
    };
  };
}
