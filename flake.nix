{
  description = "Flake NixOS + Home Manager + NUR";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

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

  outputs = { self, nixpkgs, home-manager, nur, aagl, nix-cachyos-kernel, zen-browser, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      nixosConfigurations = {
        hostname = nixpkgs.lib.nixosSystem {
          inherit system;

          modules = [
            {
               nixpkgs.overlays = [
                  nix-cachyos-kernel.overlays.default
                  nix-cachyos-kernel.overlays.pinned

                   (final: prev: {
                      linuxPackages_cachyos_bore =
                          prev.linuxPackagesFor
                             inputs.nix-cachyos-kernel.packages.${prev.system}.linux-cachyos-bore;
                   })
               ];
             }

          ./configuration.nix

          # NUR
          nur.modules.nixos.default

          # Home Manager
          home-manager.nixosModules.home-manager

          # Usuário
          { 
            nix.settings = {
              substituters = [ 
                "https://attic.xuyh0120.win/lantian"
                "https://ezkea.cachix.org"
              ];
  
              trusted-public-keys = [ 
                "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
                "ezkea.cachix.org-1:ioBm7n/6S2se7W7Ewi9jTCH8/p+MfdZfMhF0eF/A47I="
              ];

              #accept-flake-config = false;
            };

            imports = [ aagl.nixosModules.default ];

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
        inherit system nur aagl zen-browser inputs;
      };
    };
   };
  };
}
