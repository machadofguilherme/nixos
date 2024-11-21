{ config, pkgs, ... }:
let
  # Vivaldi customizado
  cus_vivaldi = pkgs.vivaldi.overrideAttrs (oldAttrs: {
    dontWrapQtApps = false;
    dontPatchELF = true;
    nativeBuildInputs = oldAttrs.nativeBuildInputs ++ [ pkgs.kdePackages.wrapQtAppsHook ];
  });
in
{
  # Aplicações
  environment.systemPackages = with pkgs; [
    kdePackages.plasma-browser-integration
    kdePackages.qtstyleplugin-kvantum
    vivaldi-ffmpeg-codecs
    qt6.qtwayland
    keychain
    cus_vivaldi
    openssl
  ];
}
