{ config, pkgs, ... }: {
  # Rede
  networking = {
    hostName = "NixOS";

    networkmanager = {
      enable = true;
      dns = "systemd-resolved";

      settings = {
        ipv6 = {
          method = "ignore";
        };
      };
    };

    resolvconf.enable = false;
    enableIPv6 = false;
  };

  environment.etc."resolv.conf".source =
    "/run/systemd/resolve/stub-resolv.conf";
}
