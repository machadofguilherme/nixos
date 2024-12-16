{ config, pkgs, ... }: {
  # Exclui pacotes do Plasma
  environment.plasma6.excludePackages = with pkgs; [
    khelpcenter
    discover
    elisa
  ];
}
