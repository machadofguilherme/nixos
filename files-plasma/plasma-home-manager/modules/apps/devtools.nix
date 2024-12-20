{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    gh
    bun
    vscode
    postman
    gitmoji-cli
  ];
}
