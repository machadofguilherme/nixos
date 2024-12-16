{ config, pkgs, ... }:
{
  # Aplicações
  environment.systemPackages = with pkgs; [
    (config._module.args.zen-browser.packages.${config._module.args.system}.specific)
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
