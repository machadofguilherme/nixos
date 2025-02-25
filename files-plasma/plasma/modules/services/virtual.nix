{ config, pkgs, ... }: {
  # Docker
  virtualisation.docker.enable = true;

  # Permite Flatpak
  xdg.portal.enable = true;
  services.flatpak.enable = true;
}
