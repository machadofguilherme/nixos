{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    gh
    bun
    vscode
    insomnia
    gitmoji-cli
  ];
}
