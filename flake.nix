# --- REFERÊNCIAS PARA ATUALIZAÇÃO DE CHAVES ---
# Ezkea (Cachix): https://cachix.org/api/v1/cache/ezkea (Campo: publicSigningKeys)
# LanTian (Attic): https://github.com/xddxdd/nur-packages#binary-cache
{
  description = "Flake NixOS + Home Manager + Plasma Manager + NUR";

  inputs = {
    catppuccin.url = "github:catppuccin/nix";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";

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

  outputs = inputs@{ self, catppuccin, nixpkgs, home-manager, plasma-manager, nur, aagl, nix-cachyos-kernel, zen-browser, ... }:
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
                linuxPackages_cachyos-bore = prev.linuxPackagesFor 
                  inputs.nix-cachyos-kernel.packages.${system}.linux-cachyos-bore;
              })
            ];
          }

          ./configuration.nix
          inputs.nur.modules.nixos.default
          inputs.aagl.nixosModules.default
          catppuccin.nixosModules.catppuccin
          home-manager.nixosModules.home-manager

          {
            nix.settings = {
              substituters = [
                "https://attic.xuyh0120.win/lantian"
                "https://cache.nixos.org"
                "https://ezkea.cachix.org"
              ];

              trusted-public-keys = [
                "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
                "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
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
                  catppuccin.homeModules.catppuccin
                  inputs.plasma-manager.homeModules.plasma-manager
                ];
              };
            };
          }
        ];
      };
    };
}
