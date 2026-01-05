{ pkgs, lib, ... }:

# Geckium
# Para atualizar:
# nix-prefetch-url --unpack https://github.com/angelbruni/Geckium/archive/refs/heads/main.tar.gz

let
  fxcss = pkgs.fetchFromGitHub {
    owner = "Aris-t2";
    repo = "CustomCSSforFx";
    rev = "master";
    sha256 = "sha256-VV3beoM9wovs6/qnR2om5uYaC5mHKha8uQBqFOr3w7c=";
  };
in
{
  programs.firefox = {
    enable = true;

    languagePacks = [
      "pt-BR"
    ];

    profiles.guilherme = {
      isDefault = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        duckduckgo-privacy-essentials
      ];

      settings = {
        # 🧬 Permite CSS customizado
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

        # 🔐 Privacidade essencial (sem quebrar sites)
        "privacy.globalprivacycontrol.enabled" = true;
        "privacy.donottrackheader.enabled" = true;
        "toolkit.telemetry.enabled" = false;
        "datareporting.healthreport.uploadEnabled" = false;

        # Geckium core
        "geckium.enabled" = true;
        "geckium.theme" = "chrome";
        "geckium.style" = "modern";

        # 🧭 UX mais Chrome-like
        "browser.tabs.tabmanager.enabled" = false;
        "browser.compactmode.show" = true;
        "browser.uidensity" = 1;

        # 🧼 Limpa ruído visual
        "browser.newtabpage.enabled" = false;
        "browser.startup.homepage" = "https://duckduckgo.com";
        
        # Buscador padrão
        "browser.search.defaultenginename" = "DuckDuckGo";
        "browser.search.order.1" = "DuckDuckGo";
        "browser.urlbar.placeholderName" = "DuckDuckGo";

        # Português brasileiro
        "intl.locale.requested" = "pt-BR";
      };
    };
  };

  home.file.".mozilla/firefox/guilherme/chrome".source =
    "${fxcss}/chrome";

  home.file.".mozilla/firefox/guilherme/chrome/userChrome.css".text = ''
    @import "./userChrome.css";
  '';
}
