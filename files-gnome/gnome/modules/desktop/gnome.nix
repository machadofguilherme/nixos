{ config, pkgs, ... }: {
  # Permite GNOME
  services.gnome.core-shell.enable = true;
  services.displayManager.defaultSession = "gnome";
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.displayManager.gdm.wayland = true;
  services.xserver.desktopManager.gnome.enable = true;
}
