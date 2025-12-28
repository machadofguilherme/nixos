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
    in
    {
      nixosConfigurations = {
        hostname = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            ./configuration.nix

            # NUR
            nur.modules.nixos.default

            # AAGL
            {
              imports = [ aagl.nixosModules.default ];
              nix.settings = aagl.nixConfig;
            }

            # Home Manager
            home-manager.nixosModules.home-manager

            # Seu usuário
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
