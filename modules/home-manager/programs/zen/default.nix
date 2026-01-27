{
  config,
  lib,
  pkgs,
  userSettings,
  inputs,
  ...
}:
{
  imports = [
    inputs.zen-browser.homeModules.beta
  ];
  
  programs.zen-browser = {
    enable = true;
    policies =
      let
        mkLockedAttrs = builtins.mapAttrs (
          _: value: {
            Value = value;
            Status = "locked";
          }
        );
      in
      {
        Preferences = mkLockedAttrs {
            "browser.aboutConfig.showWarning" = false;
            "browser.newtabpage.activity-stream.feeds.topsites" = false;
            "browser.topsites.contile.enabled" = false;
            "privacy.resistFingerprinting" = true;
            "privacy.spoof_english" = 1;
            "dom.battery.enabled" = false;
            "gfx.webrender.all" = true;
            "network.http.http3.enabled" = true;
            "network.socket.ip_addr_any.disabled" = true;
            "browser.contentblocking.category" = "strict";
            "extensions.pocket.enabled" = false;
            "extensions.screenshots.disabled" = true;
            "fission.autostart.session" = true;
            "browser.search.region" = "IT";
            "doh-rollout.home-region" = "IT";
            "browser.newtabpage.activity-stream.feeds.section.highlights" = false;
            "dom.forms.autocomplete.formautofill" = true;
            "privacy.userContext.enabled" = true;
            "privacy.userContext.ui.enabled" = true;
            "security.sandbox.content.tempDirSuffix" = "985d528a-62b5-400a-a18d-b00f8131f702";
            "extensions.autoDisableScopes" = 0;
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
            "zen.mods.enabled" = true;
        };
        
        DisableTelemetry = true;
        DisableAppUpdate = true;
        DisableFirefoxStudies = true;
        DisableFeedbackCommands = true;
        DisablePocket = true;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
        OfferToSaveLogins = true;
      };
      
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      settings = {
      };
    };
  };
}