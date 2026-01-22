{ config, pkgs, inputs, ... }:

{
  
  programs.zen-browser.policies.ExtensionSettings = let
    mkExtensionSettings = builtins.mapAttrs (_: pluginId: {
      install_url = "https://addons.mozilla.org/firefox/downloads/latest/${pluginId}/latest.xpi";
      installation_mode = "force_installed";
    });
  in mkExtensionSettings {
    "uBlock0@raymondhill.net" = "ublock-origin";
    
    "{446900e4-71c2-419f-a6a7-df9c091e268b}" = "bitwarden-password-manager";
    
    "addon@darkreader.org" = "darkreader";
  };
}
