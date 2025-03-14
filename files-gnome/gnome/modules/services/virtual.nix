{ config, pkgs, ... }: {
  # Docker
  virtualisation.docker.enable = true;

  # Permite Flatpak
  xdg.portal.enable = true;
  services.flatpak.enable = true;
  xdg.portal.config.common.default = [ "gnome" ];
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
}
