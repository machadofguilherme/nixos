{ config, pkgs, ... }: {
  networking = {
    hostName = "NixOS";
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
    
    resolvconf.enable = false;
    enableIPv6 = false;
  };

  services.resolved = {
    enable = true;
    settings.Resolve = {
      DNSSEC = "false";
      FallbackDNS = [
        "1.1.1.2"
        "9.9.9.9"
      ];
    };
  };

  hardware.bluetooth.enable = false;
}
