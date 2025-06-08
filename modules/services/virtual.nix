{ config, pkgs, ... }: {
  # Docker
  virtualisation.docker.enable = true;

  # Permite Flatpak
  xdg.portal.enable = true;
  xdg.portal.config.common.default = [ "kde" ];
  xdg.portal.extraPortals = [ pkgs.kdePackages.xdg-desktop-portal-kde ];
  services.flatpak.enable = true;
}
