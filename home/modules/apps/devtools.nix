{ config, pkgs, lib, ... }:

{
  # Pacotes do usuário
  home.packages = with pkgs; [
    gh
    bun
    maven
    ngrok
    vscode
    postman
    mongosh
    openjdk21
    gitmoji-cli
  ];

  # Programas com configuração
  programs = {
    npm.enable = true;
    direnv.enable = true;
  };
}
