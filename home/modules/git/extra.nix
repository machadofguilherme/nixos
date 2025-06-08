{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    extraConfig = {
      safe = {
        directory = [
          "/etc/nixos"
          "/home/guilherme/www"
        ];
      };
      init = {
        defaultBranch = "main";
      };
    };
  };
}
