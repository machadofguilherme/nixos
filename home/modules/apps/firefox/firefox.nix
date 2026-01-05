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

  jsonFormatter = pkgs.fetchurl {
    url = "file://${toString ./addons/json_formatter.xpi}";
    sha256 = "sha256-GenVkxQGt1GjCoP/9wi1FIAOdhenjPYtMMK86t5BMUQ=";
  };
in
{
  programs.firefox = {
    enable = true;

    profiles.guilherme = {
      isDefault = true;

      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        jsonFormatter
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
      };
    };
  };

  # 📦 Arquivos do Geckium
  home.file.".mozilla/firefox/guilherme/chrome/geckium".source = geckium;

  # 🎨 userChrome.css
  home.file.".mozilla/firefox/guilherme/chrome/userChrome.css".text = ''
    @import "geckium/chrome/userChrome.css";
  '';

  # 🌐 userContent.css (opcional)
  home.file.".mozilla/firefox/guilherme/chrome/userContent.css".text = ''
    @import "geckium/chrome/userContent.css";
  '';
}
