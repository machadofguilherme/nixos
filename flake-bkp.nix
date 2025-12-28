{
  description = "Flake NixOS + Home Manager + NUR";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    aagl.url = "github:ezKEa/aagl-gtk-on-nix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nur, aagl, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    nixosConfigurations = {
      hostname = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./configuration.nix
          nur.modules.nixos.default
          nix.settings = aagl.nixConfig;
          imports = [ aagl.nixosModules.default ];
          nur.legacyPackages."${system}".repos.iopq.modules.xraya

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.users.guilherme = import ./home/home.nix;
          }
        ];

        specialArgs = {
          inherit system nur aagl;
        };
      };
    };
  };
}
