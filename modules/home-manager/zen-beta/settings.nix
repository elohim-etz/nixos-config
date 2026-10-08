{
  "zen.view.use-single-toolbar" = true;
  "zen.view.sidebar-expanded" = true;

  "zen.view.compact.hide-toolbar" = true;
  "zen.view.compact.hide-tabbar" = true;

  "zen.watermark.enabled" = false;
  "zen.welcome-screen.seen" = true;

  "zen.tabs.show-newtab-vertical" = false;

  # enable custom userchrome
  "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
  "svg.context-properties.content.enabled" = true;
  # "layout.css.color-mix.enabled" = true;
  "browser.tabs.delayHidingAudioPlayingIconMS" = 0;
  "layout.css.backdrop-filter.enabled" = false;
  "browser.newtabpage.activity-stream.improvesearch.handoffToAwesomebar" = false;
  "privacy.userContext.enabled" = true;
  "privacy.userContext.ui.enabled" = true;
  "privacy.userContext.longPressBehavior" = 2;

  # Smooth Scroll
  "general.smoothScroll" = true;
  "general.smoothScroll.lines.durationMaxMS" = 125;
  "general.smoothScroll.lines.durationMinMS" = 125;
  "general.smoothScroll.mouseWheel.durationMaxMS" = 200;
  "general.smoothScroll.mouseWheel.durationMinMS" = 100;
  "general.smoothScroll.msdPhysics.enabled" = true;
  "general.smoothScroll.other.durationMaxMS" = 125;
  "general.smoothScroll.other.durationMinMS" = 125;
  "general.smoothScroll.pages.durationMaxMS" = 125;
  "general.smoothScroll.pages.durationMinMS" = 125;
  "mousewheel.min_line_scroll_amount" = 30;
  "mousewheel.system_scroll_override_on_root_content.enabled" = true;
  "mousewheel.system_scroll_override_on_root_content.horizontal.factor" = 175;
  "mousewheel.system_scroll_override_on_root_content.vertical.factor" = 175;
  "toolkit.scrollbox.horizontalScrollDistance" = 6;
  "toolkit.scrollbox.verticalScrollDistance" = 2;

  # Remove trackers
  "privacy.purge_trackers.enabled" = true;
  "privacy.trackingprotection.enabled" = true;
  "privacy.trackingprotection.fingerprinting.enabled" = true;
  "privacy.resistFingerprinting" = false;
  "privacy.trackingprotection.socialtracking.enabled" = true;
  "privacy.trackingprotection.cryptomining.enabled" = true;
  "privacy.globalprivacycontrol.enabled" = true;
  "privacy.globalprivacycontrol.functionality.enabled" = true;
  "privacy.donottrackheader.enabled" = true;
  "privacy.donottrackheader.value" = 1;
  "privacy.query_stripping.enabled" = true;
  "privacy.query_stripping.enabled.pbmode" = true;

  # Block telemetry
  "toolkit.telemetry.enabled" = false;
  "toolkit.telemetry.unified" = false;
  "toolkit.telemetry.server" = "data:,";
  "toolkit.telemetry.archive.enabled" = false;
  "toolkit.telemetry.newProfilePing.enabled" = false;
  "toolkit.telemetry.shutdownPingSender.enabled" = false;
  "toolkit.telemetry.updatePing.enabled" = false;
  "toolkit.telemetry.bhrPing.enabled" = false;
  "toolkit.telemetry.coverage.opt-out" = true;
  "toolkit.telemetry.firstShutdownPing.enabled" = false;
  "browser.newtabpage.activity-stream.telemetry" = false;
  "browser.ping-centre.telemetry" = false;

  # Block more unwanted stuff
  "dom.block_multiple_popups" = true;
  "browser.privatebrowsing.forceMediaMemoryCache" = true;
  "browser.contentblocking.category" = "strict";
  "browser.search.suggest.enabled" = true;
  "browser.search.suggest.enabled.private" = false;
  "privacy.popups.disable_from_plugins" = 3;
  "extensions.pocket.enabled" = false;
  "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
  "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
  "browser.newtabpage.activity-stream.feeds.topsites" = false;
  "browser.newtabpage.activity-stream.showSponsored" = false;
  "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
  "layout.word_select.eat_space_to_next_word" = false;
  "browser.shell.checkDefaultBrowser" = false;
  "toolkit.coverage.opt-out" = true;
  "toolkit.coverage.endpoint.base" = "";
  # "experiments.supported" = false;
  # "experiments.enabled" = false;
  # "experiments.manifest.uri" = "";
  "datareporting.healthreport.uploadEnabled" = false;
  "datareporting.healthreport.service.enabled" = false;
  "datareporting.policy.dataSubmissionEnabled" = false;
  "breakpad.reportURL" = "";
  "browser.tabs.crashReporting.sendReport" = false;
  "browser.crashReports.unsubmittedCheck.autoSubmit2" = false;
  "browser.formfill.enable" = false;
  "extensions.formautofill.addresses.enabled" = false;
  "extensions.formautofill.available" = "off";
  "extensions.formautofill.creditCards.available" = false;
  "extensions.formautofill.creditCards.enabled" = false;
  "extensions.formautofill.heuristics.enabled" = false;
  "app.normandy.enabled" = false;
  "app.normandy.api_url" = "";
  # "dom.webnotifications.enabled" = false;
  # "dom.webnotifications.serviceworker.enabled" = false;

  # Permissions
  # 0=always ask (default), 1=allow, 2=block
  "permissions.default.geo" = 2;
  "permissions.default.camera" = 2;
  "permissions.default.microphone" = 0;
  "permissions.default.desktop-notification" = 2;
  "permissions.default.xr" = 2; # Virtual Reality

  # General settings
  "media.ffmpeg.vaapi.enabled" = true;
  "media.av1.enabled" = false;
  "ui.key.accelKey" = 17; # Set CTRL as master key
  "intl.locale.requested" = "en-GB,en-US";
  "browser.tabs.inTitlebar" = 0;
  "browser.aboutConfig.showWarning" = false;
  "browser.aboutwelcome.enabled" = false;
  "browser.tabs.firefox-view" = false;
  "browser.startup.homepage_override.mstone" = "ignore";
  "trailhead.firstrun.didSeeAboutWelcome" = true; # Disable welcome splash
  "browser.newtab.url" = "about:blank";
  "browser.newtabpage.activity-stream.enabled" = false;
  # "browser.newtabpage.enhanced" = false;
  "browser.newtabpage.introShown" = false;
  "browser.newtabpage.pinned" = false;
  "browser.bookmarks.defaultLocation" = "toolbar";
  "browser.startup.page" = 1;
  "app.shield.optoutstudies.enabled" = false;
  "dom.security.https_only_mode" = true;
  "dom.security.https_only_mode_ever_enabled" = true;
  "identity.fxaccounts.enabled" = false;
  "app.update.auto" = false;
  "browser.startup.homepage" = "";
  "browser.sessionstore.resume_from_crash" = false;
  "browser.bookmarks.restore_default_bookmarks" = false;
  "browser.ctrlTab.recentlyUsedOrder" = false;
  "browser.discovery.enabled" = false;
  "browser.laterrun.enabled" = false;
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
  "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
  "browser.newtabpage.activity-stream.feeds.snippets" = false;
  "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" = "";
  "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.searchEngines" = "";
  "browser.protections_panel.infoMessage.seen" = true;
  # "browser.ssb.enabled" = true;
  "browser.toolbars.bookmarks.visibility" = "never"; # always, never, newtab
  #"browser.urlbar.placeholderName" = "Google";
  "browser.urlbar.suggest.topsites" = true;
  "browser.urlbar.suggest.openpage" = true;
  "browser.urlbar.suggest.history" = true;
  "browser.urlbar.suggest.bookmark" = true;
  "browser.urlbar.suggest.engines" = true;
  "browser.urlbar.showSearchSuggestionsFirst" = false;
  "browser.urlbar.suggest.recentsearches" = true;
  "browser.ml.enable" = false;
  "browser.ml.chat.enabled" = false;
  "browser.ml.linkPreview.enabled" = false;
  "browser.tabs.groups.smart.enabled" = false;
  "browser.ai.control.default" = "blocked";
  "datareporting.policy.dataSubmissionPolicyAcceptedVersion" = 2;

  "extensions.getAddons.showPane" = false;
  "extensions.htmlaboutaddons.recommendations.enabled" = false;
  "extensions.extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
  # "extensions.update.enabled" = false;
  "extensions.webcompat.enable_picture_in_picture_overrides" = true;
  "extensions.webcompat.enable_shims" = true;
  "extensions.webcompat.perform_injections" = true;
  "extensions.webcompat.perform_ua_overrides" = true;

  "extensions.enabledScopes" = 5;
  "extensions.allowPrivateBrowsingByDefault" = true;

  # Do not tell what plugins we have enabled: https://mail.mozilla.org/pipermail/firefox-dev/2013-November/001186.html
  "plugins.enumerable_names" = "";
  # "plugin.state.flash" = 0;
  "browser.search.update" = false;
  "extensions.getAddons.cache.enabled" = false;
  "extensions.ui.sitepermission.hidden" = true;
  "extensions.ui.locale.hidden" = true;

  # less background work
  "browser.sessionstore.interval" = 60000;
  "network.http.speculative-parallel-limit" = 0;
  "network.dns.disablePrefetch" = true;
  "network.dns.disablePrefetchFromHTTPS" = true;
  "network.prefetch-next" = false;
  "browser.urlbar.speculativeConnect.enabled" = false;
  "browser.places.speculativeConnect.enabled" = false;

  # cheap, low-breakage hardening
  "browser.urlbar.quicksuggest.enabled" = false;
  "pdfjs.enableScripting" = false;
  "network.IDN_show_punycode" = true;
  "network.http.referer.XOriginTrimmingPolicy" = 2;
  "security.tls.enable_0rtt_data" = false;

  "browser.uiCustomization.state" = builtins.toJSON {
    currentVersion = 20;
    newElementCount = 7;
    placements = {
      widget-overflow-fixed-list = [];
      unified-extensions-area = [
        "ublock0_raymondhill_net-browser-action"
      ];
      nav-bar = [
        "back-button"
        "forward-button"
        "stop-reload-button"
        "urlbar-container"
        # "developer-button"
        "downloads-button"
        "unified-extensions-button"

        # Extensions
        "_c4b582ec-4343-438c-bda2-2f691c16c262_-browser-action"
        "ublock0_raymondhill_net-browser-action"
      ];
      toolbar-menubar = ["menubar-items"];
      TabsToolbar = [
        "firefox-view-button"
        "tabbrowser-tabs"
        "new-tab-button"
        "alltabs-button"
      ];
      PersonalToolbar = [
        "personal-bookmarks"
        "managed-bookmarks"
      ];
    };
  };
}
