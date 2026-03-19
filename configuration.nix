{ config, ... }:

{
  # Sistema
  system.stateVersion = "25.05";
  
  # Importações
  imports = [
    ./hardware-configuration.nix
    ./modules/performance
    ./modules/graphical
    ./modules/security
    ./modules/services
    ./modules/network
    ./modules/system
    ./modules/boot
    ./modules/lang
  ];
}
