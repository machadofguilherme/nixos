{ config, pkgs, ... }: {
  # DNS
  networking.nameservers = [
    "1.1.1.2"
    "8.8.8.8"
    "8.8.4.4"
  ];
}
