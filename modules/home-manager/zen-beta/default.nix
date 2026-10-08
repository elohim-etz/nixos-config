{
  inputs,
  lib,
  pkgs,
  ...
}: {
  imports = [inputs.zen-browser.homeModules.beta];
  programs.zen-browser = {
    enable = true;
    policies = import ./policies.nix {inherit lib;};
    languagePacks = [
      "en-GB"
      "en-US"
    ];
    profiles = {
      "default" = {
        id = 0;
        name = "Default";
        isDefault = true;
        settings = import ./settings.nix;
        search = import ./search.nix {inherit pkgs;};
        userChrome = import ./userChrome.nix;
        userContent = import ./userContent.nix;
        pinsForce = true;
        pinsForceAction = "remove";
        pins = import ./pins.nix;
        mods = [
          "ad97bb70-0066-4e42-9b5f-173a5e42c6fc" # SuperPins
        ];
        extraConfig = ''
          user_pref("dom.security.https_only_mode_pbm", true);
          user_pref("dom.security.https_only_mode_error_page_user_suggestions", true);
          user_pref("browser.firefox-view.feature-tour", "{\"screen\":\"\",\"complete\":true}");
          user_pref("browser.tabs.firefox-view-next", false);
          user_pref("privacy.sanitize.sanitizeOnShutdown", false);
          user_pref("privacy.clearOnShutdown.cache", true);
          user_pref("privacy.clearOnShutdown.cookies", false);
          user_pref("privacy.clearOnShutdown.offlineApps", false);
          user_pref("browser.sessionstore.privacy_level", 0);
          user_pref("geo.enabled", false);
          user_pref("dom.battery.enabled", false);
          user_pref("browser.search.separatePrivateDefault", true);
        '';
      };
    };
  };
}
