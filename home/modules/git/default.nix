{ config, pkgs, lib, ... }: {
  programs.git = {
    enable = true;

    settings = {
      user.name = "Guilherme Machado";
      user.email = "machadofguilherme@proton.me";

      safe.directory = [
        "/etc/nixos"
        "/home/guilherme/www"
      ];

      init.defaultBranch = "main";
    };
  };
}
