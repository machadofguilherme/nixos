{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
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

  # Sistema  
  system.copySystemConfiguration = true;
  system.stateVersion = "24.11";

  # Linux
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.initrd.kernelModules = [ "amdgpu" ];
}
