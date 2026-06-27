{ config, pkgs, ... }: {
  services.xserver = {
    enable = true;
    videoDrivers = [ "amdgpu" ];
    excludePackages = [ pkgs.xterm ];
  };
}
