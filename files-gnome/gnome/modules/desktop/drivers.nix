{ config, pkgs, ... }: {
  # Aceleração Gráfica
  hardware.graphics.enable = true;

  # Drivers
  hardware.graphics.extraPackages = with pkgs; [ amdvlk ];
  hardware.graphics.extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
}
