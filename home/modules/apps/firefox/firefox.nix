{ pkgs, lib, ... }:

# Geckium
# Para atualizar:
# nix-prefetch-url --unpack https://github.com/angelbruni/Geckium/archive/refs/heads/main.tar.gz

let
  geckium = pkgs.fetchFromGitHub {
    owner = "angelbruni";
    repo = "Geckium";
    rev = "main";
    sha256 = "sha256-M7UVnPsq6YeOzt5ZUxvNfgRz6MMfcriiLpG+CpMLgyQ=";
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

  # 🎨 CSS do Geckium (perfil)
  home.file.".mozilla/firefox/guilherme/chrome".source =
    "${geckium}/Profile Folder/chrome";
}
