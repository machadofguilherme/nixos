{ config, pkgs, ... }: {
  # Servidor gráfico
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.excludePackages = [ pkgs.xterm ];
}
