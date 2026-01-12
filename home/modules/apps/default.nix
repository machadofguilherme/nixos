{ config, pkgs, ... }: {
  imports = [
    ./firefox
    ./menu.nix
    ./media.nix
    ./vscode.nix
    ./devtools.nix
    ./utilities.nix
  ];
}
