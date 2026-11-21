{
  config,
  pkgs,
  ...
}: {
  programs.firefox = {
    enable = true;
    configPath = "${config.xdg.configHome}/mozilla/firefox";
    package = pkgs.firefox;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFeedbackCommands = true;
      DisableAppUpdate = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      # NewTabPage = false;
      # Homepage.StartPage = "none";

      # GenerativeAI = {
      #   Enabled = false;
      #   Chatbot = false;
      #   LinkPreviews = false;
      #   TabGroups = false;
      # };

      TranslateEnabled = true;

      AIControls = {
        Default.Value = "blocked";
        Translations.Value = "available";
        PDFAltText.Value = "blocked";
        SmartTabGroups.Value = "blocked";
        LinkPreviewKeyPoints.Value = "blocked";
        SidebarChatbot.Value = "blocked";
        SmartWindow.Value = "blocked";
      };

      EnableTrackingProtection = {
        Value = true;
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };

      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        UrlbarInterventions = false;
        SkipOnboarding = true;
        MoreFromMozilla = false;
        FirefoxLabs = false;
      };

      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;

      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
      };
      "3rdparty".Extensions."uBlock0@raymondhill.net".adminSettings = builtins.toJSON {
        userSettings = {
          advancedUserEnabled = true;
          suspendUntilListsAreLoaded = true;
          prefetchingDisabled = true;
          hyperlinkAuditingDisabled = true;
          cloudStorageEnabled = false;
          contextMenuEnabled = false;
          showIconBadge = false;
          collapseBlocked = true;
        };

        hostnameSwitchesString = "no-csp-reports: * true";

        selectedFilterLists = [
          "user-filters"
          "ublock-filters"
          "ublock-badware"
          "ublock-quickfixes"
          "ublock-unbreak"
          "easylist"
          "easyprivacy"
          "urlhaus-1"
        ];
      };
    };

    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;

      settings = {
        # Custom preferences
        "browser.compactmode.show" = true;
        "browser.uidensity" = 1;
        "ui.key.menuAccessKeyFocuses" = false;
        "ui.key.menuAccessKey" = 0;

        # Sidebar
        "sidebar.revamp" = true;
        "sidebar.visibility" = "hide-sidebar";
        "sidebar.main.tools" = "";
        "sidebar.verticalTabs" = true;

        "browser.toolbars.bookmarks.visibility" = "never";
        "browser.tabs.hoverPreview.enabled" = false;
        "browser.tabs.hoverPreview.showThumbnails" = false;
        "toolkit.cosmeticAnimations.enabled" = false;

        # Disable AI
        "browser.ai.control.default" = "blocked";
        "browser.ai.control.translations" = "available";
        "browser.ml.enable" = false;
        "browser.ml.chat.enabled" = false;
        "browser.ml.chat.menu" = false;
        "browser.ml.chat.sidebar" = false;
        "browser.ml.chat.shortcuts" = false;
        "browser.ml.chat.page" = false;
        "browser.ml.chat.provider" = "";
        "browser.ml.linkPreview.enabled" = false;
        "browser.tabs.groups.smart.enabled" = false;
        "browser.tabs.groups.smart.userEnabled" = false;
        "extensions.ml.enabled" = false;
        "browser.translations.automaticallyPopup" = false;
        "pdfjs.enableAltText" = false;

        # BetterFox picks
        # "dom.ipc.processCount" = 4;
        "dom.ipc.processPrelaunch.fission.number" = 0;
        "browser.sessionhistory.max_total_viewers" = 2;
        "browser.cache.memory.capacity" = 32768;
        "browser.cache.disk.enable" = true;
        "browser.sessionstore.interval" = 60000;
        "browser.pagethumbnails.capturing_disabled" = true;
        "browser.tabs.unloadOnLowMemory" = true;
        "image.mem.decode_bytes_at_a_time" = 32768;
        # "gfx.content.skia-font-cache-size" = 20;
        # "gfx.canvas.accelerated.cache-items" = 4096;
        # "gfx.canvas.accelerated.cache-size" = 512;
        # "media.memory_cache_max_size" = 65536;
        # "media.cache_readahead_limit" = 7200;
        # "media.cache_resume_threshold" = 3600;
        "network.http.max-connections" = 900;
        "network.http.max-persistent-connections-per-server" = 6;
        # "network.ssl_tokens_cache_capacity" = 10240;

        "dom.ipc.processCount" = 2;
        "dom.ipc.processPrelaunch.enabled" = false;
        "fission.webContentIsolationStrategy" = 2;
        "media.cache_readahead_limit" = 60;
        "media.cache_resume_threshold" = 30;
        "media.memory_cache_max_size" = 8192;
        "media.memory_caches_combined_limit_kb" = 131072;
        "gfx.canvas.accelerated.cache-items" = 1024;
        "gfx.canvas.accelerated.cache-size" = 128;
        "gfx.content.skia-font-cache-size" = 5;
        "image.mem.surfacecache.max_size_kb" = 262144;

        "browser.sessionstore.max_tabs_undo" = 5;
        "browser.sessionstore.max_windows_undo" = 1;

        "media.ffmpeg.vaapi.enabled" = true;
        "media.av1.enabled" = false;
        # Native Wayland/portal file picker
        "widget.use-xdg-desktop-portal.file-picker" = 1;

        # Background network chatter
        "dom.push.enabled" = false;
        "network.connectivity-service.enabled" = false;
        "network.captive-portal-service.enabled" = false;
        "browser.newtabpage.activity-stream.feeds.telemetry" = false;
        "browser.newtabpage.activity-stream.telemetry" = false;

        # Background Services
        "browser.backup.enabled" = false;
        "beacon.enabled" = false;
        "network.early-hints.enabled" = false;
        "network.early-hints.preconnect.enabled" = false;
        "extensions.getAddons.cache.enabled" = false;
        "browser.region.update.enabled" = false;
        "browser.shopping.experience2023.enabled" = false;
        "messaging-system.rsexperimentloader.enabled" = false;
        "network.trr.mode" = 5;

        # Disable all Firefox sponsored content
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.newtabpage.activity-stream.showSponsoredCheckboxes" = false;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.system.showSponsored" = false;
        "browser.topsites.contile.enabled" = false;
        "browser.newtabpage.activity-stream.unifiedAds.tiles.enabled" = false;

        "extensions.getAddons.showPane" = false;
        "extensions.htmlaboutaddons.recommendations.enabled" = false;
        "extensions.webcompat-reporter.enabled" = false;

        "accessibility.force_disabled" = 1;

        # Disable Telemetry
        "datareporting.policy.dataSubmissionEnabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.archive.enabled" = false;
        "toolkit.telemetry.newProfilePing.enabled" = false;
        "toolkit.telemetry.shutdownPingSender.enabled" = false;
        "toolkit.telemetry.updatePing.enabled" = false;
        "toolkit.telemetry.bhrPing.enabled" = false;
        "toolkit.telemetry.firstShutdownPing.enabled" = false;
        "toolkit.telemetry.coverage.opt-out" = true;
        "toolkit.coverage.opt-out" = true;
        "toolkit.coverage.endpoint.base" = "";
        "browser.ping-centre.telemetry" = false;
        "app.shield.optoutstudies.enabled" = false;
        "app.normandy.enabled" = false;
        "app.normandy.api_url" = "";
        "breakpad.reportURL" = "";
        "browser.tabs.crashReporting.sendReport" = false;
        "browser.crashReports.unsubmittedCheck.enabled" = false;
        "browser.discovery.enabled" = false;
        "browser.vpn_promo.enabled" = false;
        "browser.promo.focus.enabled" = false;
        "browser.contentblocking.report.hide_vpn_banner" = true;
        "browser.contentblocking.report.vpn.enabled" = false;
        "browser.contentblocking.report.monitor.enabled" = false;
        "browser.aboutwelcome.enabled" = false;
        "browser.startup.homepage_override.mstone" = "ignore";
        "dom.private-attribution.submission.enabled" = false;

        # Disable Suggestions
        "browser.urlbar.quicksuggest.enabled" = false;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        "browser.urlbar.suggest.trending" = false;
        "browser.urlbar.trending.featureGate" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.search.suggest.enabled" = false;
        "browser.urlbar.speculativeConnect.enabled" = false;
        "browser.places.speculativeConnect.enabled" = false;
        "browser.urlbar.unitConversion.enabled" = true;

        # Securefox + arkenfox essentials
        "network.cookie.cookieBehavior" = 5;
        "privacy.trackingprotection.enabled" = true;
        "privacy.trackingprotection.socialtracking.enabled" = true;
        "privacy.trackingprotection.cryptomining.enabled" = true;
        "privacy.trackingprotection.fingerprinting.enabled" = true;
        "privacy.fingerprintingProtection" = true;
        "privacy.query_stripping.enabled" = true;
        "privacy.query_stripping.enabled.pbmode" = true;
        "privacy.globalprivacycontrol.enabled" = true;
        "cookiebanners.service.mode" = 1;
        "cookiebanners.service.mode.privateBrowsing" = 1;
        "dom.security.https_only_mode" = true;
        "network.http.referer.XOriginTrimmingPolicy" = 2;
        "security.tls.enable_0rtt_data" = false;
        "network.dns.disablePrefetch" = true;
        "network.prefetch-next" = false;
        "network.predictor.enabled" = false;
        "network.http.speculative-parallel-limit" = 0;
        "media.peerconnection.ice.default_address_only" = true;
        "browser.safebrowsing.downloads.remote.enabled" = false;
        "pdfjs.enableScripting" = false;
        "signon.rememberSignons" = true;
        "signon.autofillForms" = true;
        "signon.generation.enabled" = true;
        "signon.management.page.breach-alerts.enabled" = false;
        "extensions.formautofill.addresses.enabled" = false;
        "extensions.formautofill.creditCards.enabled" = false;
        "permissions.default.desktop-notification" = 2;

        # Qos
        "browser.shell.checkDefaultBrowser" = false;
        "browser.aboutConfig.showWarning" = false;
        "browser.download.useDownloadDir" = true;
        "devtools.debugger.remote-enabled" = false;
        "browser.uiCustomization.state" = builtins.toJSON {
          placements = {
            widget-overflow-fixed-list = [];
            unified-extensions-area = [];
            nav-bar = [
              "alltabs-button"
              "back-button"
              "forward-button"
              "stop-reload-button"
              "home-button"
              "customizableui-special-spring1"
              "customizableui-special-spring2"
              "urlbar-container"
              "customizableui-special-spring3"
              "customizableui-special-spring4"
              "unified-extensions-button"
              "ublock0_raymondhill_net-browser-action"
              "sidebar-button"
            ];
            toolbar-menubar = ["menubar-items"];
            TabsToolbar = [];
            vertical-tabs = ["tabbrowser-tabs"];
            PersonalToolbar = ["personal-bookmarks"];
          };
          seen = ["developer-button" "ublock0_raymondhill_net-browser-action"];
          dirtyAreaCache = ["nav-bar" "vertical-tabs" "toolbar-menubar" "TabsToolbar" "PersonalToolbar" "unified-extensions-area"];
          currentVersion = 23;
          newElementCount = 3;
        };
      };
    };
  };
}
