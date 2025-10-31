{ config, pkgs, ... }:

{
  home.username = "guilherme";
  home.stateVersion = "25.05";
  home.homeDirectory = "/home/guilherme";

  imports = [
    ./modules/git
    ./modules/apps
    ./modules/shell
    ./modules/system
  ];

  programs.home-manager.enable = true;
}
