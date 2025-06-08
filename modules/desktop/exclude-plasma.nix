{ config, pkgs, ... }: {
  # Exclui pacotes do Plasma
  environment.plasma6.excludePackages = with pkgs; [
    kdePackages.khelpcenter
    kdePackages.discover
    kdePackages.elisa
  ];
}
