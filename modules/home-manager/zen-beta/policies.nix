{lib, ...}: let
  importedLists = [
    "https://raw.githubusercontent.com/yokoffing/filterlists/main/annoyance_list.txt"
    "https://raw.githubusercontent.com/yokoffing/filterlists/main/privacy_essentials.txt"
    "https://raw.githubusercontent.com/DandelionSprout/adfilt/master/BrowseWebsitesWithoutLoggingIn.txt"
    "https://easylist-downloads.adblockplus.org/antiadblockfilters.txt"
    "https://gitflic.ru/project/magnolia1234/bypass-paywalls-clean-filters/blob/raw?file=bpc-paywall-filter.txt"
  ];
in {
  AllowFileSelectionDialogs = true;
  AppAutoUpdate = false;
  AutofillAddressEnabled = false;
  AutofillCreditCardEnabled = false;
  #AutoLaunchProtocolsFromOrigins = { };
  BackgroundAppUpdate = false;
  BlockAboutAddons = false;
  BlockAboutConfig = false;
  BlockAboutProfiles = false;
  BlockAboutSupport = false;
  #Containers = { };
  DisableAppUpdate = true;
  DisableFirefoxScreenshots = false;
  DisableFirefoxStudies = true;
  DisableFormHistory = false;
  DisableMasterPasswordCreation = true;
  DisablePocket = true;
  DisablePrivateBrowsing = false;
  DisableProfileImport = false;
  DisableProfileRefresh = false;
  DisableSafeMode = false;
  DisableTelemetry = true;
  DisableFeedbackCommands = true;
  DontCheckDefaultBrowser = true;
  Permissions.Notifications.Block = ["https://www.instagram.com"];
  DNSOverHTTPS = {
    Enabled = true;
  };
  EnableTrackingProtection = {
    Value = true;
    Locked = true;
    Cryptomining = true;
    Fingerprinting = true;
  };
  EncryptedMediaExtensions = {
    Enabled = true;
  };
  ExtensionUpdate = true;
  FirefoxHome = {
    Search = false;
    TopSites = false;
    SponsoredTopSites = false;
    Highlights = false;
    Pocket = false;
    SponsoredPocket = false;
    Snippets = false;
    Locked = false;
  };
  HardwareAcceleration = true;
  ManualAppUpdateOnly = true;
  NoDefaultBookmarks = false;
  OfferToSaveLogins = true;
  PasswordManagerEnabled = true;
  PictureInPicture = {
    Enabled = true;
  };
  Preferences = {
    "browser.tabs.warnOnClose" = {
      Value = true;
    };
  };
  PromptForDownloadLocation = true;
  SearchSuggestEnabled = true;
  ShowHomeButton = false;
  StartDownloadsInTempDirectory = false;
  UserMessaging = {
    ExtensionRecommendations = false;
    SkipOnboarding = true;
  };
  ExtensionSettings = {
    "*" = {
      blocked_install_message = "Addon is not added in the nix config";
      installation_mode = "blocked";
    };
    "uBlock0@raymondhill.net" = {
      private_browsing = true;
      default_area = "navbar";
      installation_mode = "force_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
    };
    "{c4b582ec-4343-438c-bda2-2f691c16c262}" = {
      private_browsing = true;
      default_area = "navbar";
      installation_mode = "force_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/600-sound-volume/latest.xpi";
    };
    "sponsorBlocker@ajay.app" = {
      private_browsing = true;
      default_area = "menupanel";
      installation_mode = "force_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/sponsorblock/latest.xpi";
    };
    "{762f9885-5a13-4abd-9c77-433dcd38b8fd}" = {
      private_browsing = true;
      installation_mode = "force_installed";
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/return-youtube-dislikes/latest.xpi";
    };
  };
  "3rdparty".Extensions = {
    "uBlock0@raymondhill.net" = {
      advancedSettings = [
        [
          "userResourcesLocation"
          "https://raw.githubusercontent.com/pixeltris/TwitchAdSolutions/master/video-swap-new/video-swap-new-ublock-origin.js"
        ]
      ];
      adminSettings = {
        userFilters = lib.concatMapStrings (x: x + "\n") [
          "twitch.tv##+js(twitch-videoad)"
          "||1337x.vpnonly.site"
          "||snowvan.xyz^"
        ];
        userSettings = {
          uiTheme = "dark";
          uiAccentCustom = true;
          uiAccentCustom0 = "#CA9EE6";
          cloudStorageEnabled = lib.mkForce false; # Security liability?
          advancedUserEnabled = true;
          userFiltersTrusted = true;
          externalLists = lib.concatStringsSep "\n" importedLists;
          popupPanelSections = 31;
        };
        selectedFilterLists =
          [
            # core
            "ublock-filters" "ublock-badware" "ublock-privacy" "ublock-quick-fixes" "ublock-unbreak"
            "easylist" "easyprivacy" "plowe-0" "urlhaus-1" "curben-phishing"
            "adguard-spyware-url"
            "block-lan"
            # cookie notices and annoyances (EasyList family only)
            "fanboy-cookiemonster" "ublock-cookies-easylist"
            "easylist-annoyances" "easylist-chat" "easylist-newsletters" "easylist-notifications"
            "ublock-annoyances" "fanboy-social"
          ]
          ++ importedLists
          ++ ["user-filters"];
      };
    };
  };
}
