{ config, pkgs, ... }: {
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
}
