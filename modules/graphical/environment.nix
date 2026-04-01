{ config, pkgs, ... }: {
  # Permite GNOME
  services.desktopManager.gnome.enable = true;

  services.displayManager = {
    defaultSession = "gnome";
    gdm.enable = true;
  };

 programs.firefox.preferences = {
    "widget.gtk.libadwaita-colors.enabled" = false;
  };
}
