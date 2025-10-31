{ config, pkgs, lib, ... }:

{
  programs.git = {
    enable = true;
    settings = {
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
