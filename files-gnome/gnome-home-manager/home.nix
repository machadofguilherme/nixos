{ config, pkgs, ... }:

{
  # Usuário
  home.username = "guilherme";
  home.stateVersion = "25.05";
  home.homeDirectory = "/home/guilherme";

  # Importações
  imports = [
    ./modules/git
    ./modules/apps
    ./modules/theme
    ./modules/shell
    ./modules/system
  ];

  # Permissões Especiais
  nixpkgs.config.allowUnfree = true;

  # Home Manager
  programs.home-manager.enable = true;
}
