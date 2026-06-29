{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.config.permittedInsecurePackages = [
    "ventoy-qt5-1.1.12"
    "openssl-1.1.1w"
  ];

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
      "owned-only" = "false";

      "temporary-root-policies" = {
        result = {
          "path-regex" = "/result[^/]*$";
          period = "2d";
        };
      };
    };
  };
}
