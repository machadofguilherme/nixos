{ config, pkgs, ... }:

{
  # Sistema
  system.stateVersion = "24.11";
  system.copySystemConfiguration = true;
  
  # Importações
  imports = [
    ./hardware-configuration.nix
    ./modules/security
    ./modules/services
    ./modules/network
    ./modules/desktop
    ./modules/system
    ./modules/boot
    ./modules/misc
    ./modules/lang
  ];

  # Linux
  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
