{ config, pkgs, lib, ... }: {
  # Experimental
  nix.settings.experimental-features = [ 
    "nix-command" 
    "flakes" 
  ];

  # Licenciamento de Software
  nixpkgs.config.allowUnfree = false;

  # Usuários Confiáveis
  nix.settings.trusted-users = [ 
    "root" 
    "guilherme"
  ];

  # Cores
  nix.settings.cores = 16;

  # Limpeza e Otimização do Sistema
  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;
  services.angrr = {
    enable = true;
    settings = {
      global = {
        retention = {
         maxAge = "2d";
        };
        rules = {
          ownedOnly = false;
          removeRoot = false;
        };
      };
    };
  };
}
