{ pkgs, lib, ... }:
let
  profilePath = ".zen/guilherme";
in
{
  home.packages = with pkgs.nur.repos.rycee.firefox-addons; [
    ublock-origin
    duckduckgo-privacy-essentials
  ];

  home.file."${profilePath}/user.js".text = ''
    // Performance e Renderização
    user_pref("layers.acceleration.force-enabled", true);
    user_pref("gfx.webrender.all", true);

    // Privacidade
    user_pref("privacy.globalprivacycontrol.enabled", true);
    user_pref("privacy.donottrackheader.enabled", true);
    user_pref("toolkit.telemetry.enabled", false);
    user_pref("datareporting.healthreport.uploadEnabled", false);
      
    // Localização e Busca
    user_pref("intl.locale.requested", "pt-BR");
    user_pref("browser.search.defaultenginename", "DuckDuckGo");
    user_pref("browser.newtabpage.enabled", false);
    user_pref("browser.startup.homepage", "https://duckduckgo.com");

    // Integração com o Sistema
    user_pref("widget.use-xdg-desktop-portal.file-picker", 1);
  '';
}
