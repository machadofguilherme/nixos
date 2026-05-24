{ config, pkgs, ... }:

{
  networking = {
    hostName = "NixOS";
    enableIPv6 = true;

    networkmanager = {
      enable = true;
      wifi.powersave = false;
      dns = "systemd-resolved";
      connectionConfig = {
        "ipv6.method" = "disabled";
      };
    };

    resolvconf.enable = false;
  };

  services.resolved = {
    enable = true;

    settings = {
      Resolve = {
        DNSSEC = "false";
        DNS = [
          "1.1.1.2"
          "1.0.0.2"
        ];

        FallbackDNS = [
          "9.9.9.9"
        ];
      };
    };
  };

  hardware.bluetooth.enable = false;
}
