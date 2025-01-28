{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    gh
    bun
    vscode
    postman
    mongosh
    gitmoji-cli
    code-cursor
  ];
}
