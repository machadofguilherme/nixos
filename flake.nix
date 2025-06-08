
{
  description = "Flake NixOS + Home Manager + Plasma Manager + NUR";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, plasma-manager, nur, zen-browser, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        hostname = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./configuration.nix
            nur.modules.nixos.default
            nur.legacyPackages."${system}".repos.iopq.modules.xraya

            home-manager.nixosModules.home-manager

            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;

              home-manager.users.guilherme = import ./home/home.nix;

              home-manager.sharedModules = [
                plasma-manager.homeManagerModules.plasma-manager
              ];
            }
          ];

          specialArgs = {
            inherit system zen-browser plasma-manager nur;
          };
        };
      };
    };
}
