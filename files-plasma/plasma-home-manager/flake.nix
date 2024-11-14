{
  description = "Home Manager";

  inputs = {
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, zen-browser, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      homeConfigurations."guilherme" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home.nix

          {
            home.packages = [
              zen-browser.packages.${system}.default
            ];
          }
        ];
      };
    };
}
