{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnsupportedSystem = true;

  nix.settings = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    trusted-users = [
      "root"
      "guilherme"
    ];

    cores = 16;
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
