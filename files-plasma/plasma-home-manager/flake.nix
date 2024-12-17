{
  description = "Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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

  outputs = { nixpkgs, home-manager, plasma-manager, nur, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      nurPkgs = import nur { inherit pkgs; };
    in {
      homeConfigurations."guilherme" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          plasma-manager.homeManagerModules.plasma-manager
          ./home.nix
          
          {
            nixpkgs.overlays = [
              nur.overlays.default
            ];
          }
        ];
      };
    };
}
