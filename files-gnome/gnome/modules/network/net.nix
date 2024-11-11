{ config, pkgs, ... }: {
  # Rede
  networking.hostName = "NixOS";
  networking.networkmanager.enable = true;
  networking.networkmanager.dns = "none";
}
