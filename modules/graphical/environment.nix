{ config, pkgs, ... }: {
  # Permite COSMIC
  services.desktopManager.cosmic.enable = true;

  services.displayManager = {
    defaultSession = "cosmic";
    cosmic-greeter.enable = true;
  };

  services.system76-scheduler.enable = true;

 programs.firefox.preferences = {
    "widget.gtk.libadwaita-colors.enabled" = false;
  };
}
