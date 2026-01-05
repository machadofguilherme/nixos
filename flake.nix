{
  description = "Flake NixOS + Home Manager + NUR + Plasma Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

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

  outputs = { self, nixpkgs, home-manager, nur, plasma-manager, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      geckium = pkgs.fetchFromGitHub {
        owner = "angelbruni";
        repo = "Geckium";
        rev = "main";
        sha256 = "sha256-M7UVnPsq6YeOzt5ZUxvNfgRz6MMfcriiLpG+CpMLgyQ=";
      };
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
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";

              extraSpecialArgs = {
                inherit geckium;
              };

              users.guilherme = {
                imports = [
                  ./home/home.nix
                  plasma-manager.homeModules.plasma-manager
                ];
              };
            };
        }
      ];

      specialArgs = {
        inherit system nur plasma-manager inputs geckium;
      };
    };
   };
  };
}
