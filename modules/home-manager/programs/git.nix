{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    signing = {
      key = "ABB6A31D16C85F49";
      signByDefault = true;
    };

    settings = {
      user = {
        name  = "Naveen";
        email = "133593113+elohim-etz@users.noreply.github.com";
        signingkey = "ABB6A31D16C85F49";
      };

      core = {
        editor = "nvim";
      };

      commit = {
        gpgsign = true;
      };

      tag = {
        gpgSign = true;
      };

      alias = {
        rb   = "rebase";
        psf  = "push --force-with-lease";
        mff  = "merge --ff-only";
        cs   = "cherry-pick --signoff";
        cc   = "cherry-pick --continue";
        cp   = "cherry-pick";
        rh   = "reset --hard";
        rs   = "reset --soft";
        ca   = "commit --amend";
        co   = "checkout";
        rv-l = "rev-list --left-right --count";
      };
    };
  };
}
