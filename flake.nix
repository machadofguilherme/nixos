#
# ASSINATURAS DOS SUBSTITUTERS:
#
# https://www.google.com/url?sa=E&source=gmail&q=https://nixos.org/manual/nix/stable/package-management/binary-cache-substituter
# https://cachix.org/api/v1/cache/ezkea
# https://attic.xuyh0120.win/lantian/stats ou a raiz do cache: https://attic.xuyh0120.win/lantian
#
{
  description = "Flake NixOS + Home Manager + Plasma Manager + NUR";

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

    nur.url = "github:nix-community/NUR";

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, plasma-manager, nur, aagl, nix-cachyos-kernel, zen-browser, ... }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.hostname = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs system nur aagl nix-cachyos-kernel zen-browser; };

        modules = [
          {
            nixpkgs.overlays = [
              inputs.nix-cachyos-kernel.overlays.default
              (final: prev: {
                linuxPackages_cachyos_bore = prev.linuxPackagesFor 
                  inputs.nix-cachyos-kernel.packages.${system}.linux-cachyos-bore;
              })
            ];
          }

          ./configuration.nix
          inputs.nur.modules.nixos.default
          inputs.aagl.nixosModules.default
          home-manager.nixosModules.home-manager

          {
            nix.settings = {
              substituters = [
                "https://cache.nixos.org"
                "https://ezkea.cachix.org"
                "https://attic.xuyh0120.win/lantian"
              ];

              trusted-public-keys = [
                "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
                "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
              ];

              trusted-users = [
                "root"
                "guilherme"
              ];
            };

            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = { inherit inputs nur aagl plasma-manager; };
              
              users.guilherme = {
                imports = [
                  ./home/home.nix
                  inputs.plasma-manager.homeModules.plasma-manager
                ];
              };
            };
          }
        ];
      };
    };
}
