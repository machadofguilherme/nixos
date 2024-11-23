{
  description = "Flake que carrega configuration.nix para NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        hostname = nixpkgs.lib.nixosSystem {
          system = system;
          modules = [
            ./configuration.nix
          ];
        };
      };
    };
}
