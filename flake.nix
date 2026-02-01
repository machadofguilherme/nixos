{
  description = "Flake NixOS + Home Manager + NUR + Plasma Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    aagl = {
      url = "github:ezKEa/aagl-gtk-on-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nur, aagl, ... }@inputs:
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

          # Home Manager
          home-manager.nixosModules.home-manager

          # Usuário
          {        
            imports = [ aagl.nixosModules.default ];
            nix.settings = aagl.nixConfig;

            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";

              users.guilherme = {
                imports = [
                  ./home/home.nix
                ];
              };
            };
        }
      ];

      specialArgs = {
        inherit system nur aagl inputs;
      };
    };
   };
  };
}
