{ config, pkgs, lib, ... }:

{
  home.username = "guilherme";
  home.stateVersion = "25.05";
  home.homeDirectory = "/home/guilherme";

  imports = [
    ./modules/git
    ./modules/apps
    ./modules/shell
    ./modules/system
    ./modules/theme
  ];

  home.activation = {
    removeGtkBackups = lib.hm.dag.entryAfter ["writeBoundary"] ''
      $DRY_RUN_CMD rm -rf $HOME/.cache.bak
      $DRY_RUN_CMD rm -f $HOME/.gtkrc-2.0.backup
      $DRY_RUN_CMD rm -rf $HOME/.config/dconf.bak
      $DRY_RUN_CMD rm -f $HOME/.config/gtk-3.0/settings.ini.backup
      $DRY_RUN_CMD rm -f $HOME/.config/gtk-4.0/settings.ini.backup
    '';
  };

  programs.home-manager.enable = true;
}
