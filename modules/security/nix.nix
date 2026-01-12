{ config, pkgs, lib, ... }:

{
  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    trusted-users = [
      "root"
      "guilherme"
    ];

    cores = 12;
    max-jobs = "auto";

    sandbox = true;
    builders-use-substitutes = true;

    keep-outputs = false;
    keep-derivations = false;

    auto-optimise-store = true;
  };

  nix.optimise.automatic = true;

  services.angrr = {
    enable = true;
    settings = {
      global = {
        retention.maxAge = "2d";
        rules = {
          ownedOnly = false;
          removeRoot = false;
        };
      };
    };
  };
}
