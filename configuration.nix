{ config, pkgs, ... }:

{
  # Sistema
  system.stateVersion = "25.05";
  
  # Importações
  imports = [
    ./hardware-configuration.nix
    ./modules/graphical
    ./modules/security
    ./modules/services
    ./modules/network
    ./modules/system
    ./modules/boot
    ./modules/lang
  ];

  # Linux
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
