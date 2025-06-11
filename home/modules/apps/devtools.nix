{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    gh
    bun
    ngrok
    vscode
    postman
    mongosh
    gitmoji-cli
  ];
}
