{ config, pkgs, ... }: {
  # Permite Plasma
  services.desktopManager.plasma6.enable = true;

  services.displayManager = {
    defaultSession = "kde";
    plasma-login-manager.enable = true;
  };
}
