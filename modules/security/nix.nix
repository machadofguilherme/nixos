{ config, pkgs, lib, ... }: {
  # Experimental
  nix.settings.experimental-features = [ 
    "nix-command" 
    "flakes" 
  ];

  # Usuários Confiáveis
  nix.settings.trusted-users = [ 
    "root" 
    "guilherme"
  ];

  # Permissões Especiais
  nixpkgs.config.allowUnfree = true;

  # Cores
  nix.settings.cores = 16;

  # Limpeza e Otimização da Store
  nix.optimise.automatic = true;
  nix.settings.auto-optimise-store = true;

  # Permite pacotes Steam
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-unwrapped"
    "steam-original"
    "steam-run"
  ];
}
