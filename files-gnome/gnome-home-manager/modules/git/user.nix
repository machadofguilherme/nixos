{ config, pkgs, ... }: {
  programs.git = {
   enable = true;
   userName = "Guilherme Machado";
   userEmail = "machadofguilherme@proton.me";
  };
}
