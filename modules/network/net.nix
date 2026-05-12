{ config, pkgs, ... }: {
  networking = {
    hostName = "NixOS";
    networkmanager = {
      enable = true;
      wifi.powersave = false;
      dns = "systemd-resolved";
      connectionConfig."ipv4.ignore-auto-dns" = true;
    };

    resolvconf.enable = false;
    enableIPv6 = false;
  };

  services.resolved = {
    enable = true;
    settings = {
      Resolve = {
        DNSSEC = "false";
        DNS = "1.1.1.2 1.0.0.2";
        FallbackDNS = "9.9.9.9";
        Domains = "~.";
        DNSStubListenerExtra = "127.0.0.53";
      };
    };
  };

  hardware.bluetooth.enable = false;
}
