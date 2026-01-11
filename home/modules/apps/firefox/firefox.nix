{ pkgs, lib, ... }:

# Para obter o rev do repositório
# git ls-remote https://github.com/user/repo

{
  programs.firefox = {
    enable = true;

    languagePacks = [ "pt-BR" ];

    nativeMessagingHosts.packages = with pkgs; [ 
      kdePackages.plasma-browser-integration
    ];

    profiles.guilherme = {
      id = 0;
      name = "guilherme";
      isDefault = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        duckduckgo-privacy-essentials
      ];
      
      # Configurações essenciais para o Geckium
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.tabs.drawInTitlebar" = true; 
        "browser.uidensity" = 1;
        "layers.acceleration.force-enabled" = true; # Melhora a renderização do tema
        "privacy.globalprivacycontrol.enabled" = true;
        "privacy.donottrackheader.enabled" = true;
        "toolkit.telemetry.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;
        "svg.context-properties.content.enabled" = true;
        
        # Suas preferências existentes
        "intl.locale.requested" = "pt-BR";
        "browser.search.defaultenginename" = "DuckDuckGo";
        "browser.newtabpage.enabled" = false;
        "browser.startup.homepage" = "https://duckduckgo.com";
        "browser.search.order.1" = "DuckDuckGo";
        "browser.urlbar.placeholderName" = "DuckDuckGo";
      };
    };
  };

   home.file.".mozilla/firefox/guilherme/chrome" = {
    source = "${builtins.fetchGit {
      url = "https://github.com/Godiesc/firefox-one";
      rev = "0f12f6658eb3c99581f4ddc517dcb0872a1ee60e";
    }}/chrome";
    recursive = true;
  };
}
