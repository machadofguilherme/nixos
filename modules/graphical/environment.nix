{ config, pkgs, ... }: {
  # Permite GNOME
  services.desktopManager.gnome.enable = true;

  services.displayManager = {
    gdm.enable = true;
    gdm.wayland = true;
    defaultSession = "gnome";
  };
}
