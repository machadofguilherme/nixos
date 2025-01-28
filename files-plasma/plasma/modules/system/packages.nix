{ config, pkgs, zen-browser, system, ... }:
{
  # Aplicações
  environment.systemPackages = with pkgs; [
    zen-browser.packages."${system}".twilight
    kdePackages.plasma-browser-integration
    kdePackages.qtstyleplugin-kvantum
    kdePackages.flatpak-kcm
    kdePackages.kcmutils
    kdePackages.sddm-kcm
    qt6.qtwayland
    keychain
    openssl
  ];
}
