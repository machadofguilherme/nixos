{ config, pkgs, ... }: {
  # DNS
  networking = {
    nameservers = [
      "1.1.1.2"
      "1.0.0.2"
    ];
  };

  services.resolved.enable = true;
}
