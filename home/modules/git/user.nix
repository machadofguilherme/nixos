{ config, pkgs, ... }: {
  programs.git = {
   enable = true;
   settings.user.name = "Guilherme Machado";
   settings.user.email = "machadofguilherme@proton.me";
  };
}
