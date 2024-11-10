{ config, pkgs, ... }:

{
  # Usuário
  home.username = "guilherme";
  home.stateVersion = "24.11";
  home.homeDirectory = "/home/guilherme";

  # Importações
  imports = [
    ./modules/git
    ./modules/apps
    ./modules/shell
    ./modules/system
  ];

  # Permissões Especiais
  nixpkgs.config.allowUnfree = true;

  # Home Manager
  programs.home-manager.enable = true;
}
