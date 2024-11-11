{ config, pkgs, ... }: {
  # Fish
  programs = {
    fish = {
      enable = true;
      interactiveShellInit = ''
        set -g fish_greeting ""
        ${pkgs.pfetch}/bin/pfetch
      '';
    };
  };
}
