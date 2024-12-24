{
  description = "Flake que carrega configuration.nix para NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = { self, nixpkgs, zen-browser, ... }: 
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        hostname = nixpkgs.lib.nixosSystem {
          system = system;
          
          modules = [
            ./configuration.nix
            {
              config._module.args = {
                zen-browser = zen-browser;
                system = system;
              };
            }
          ];
        };
      };
    };
}
