{ config, pkgs, ... }: {
  programs.plasma = {
    enable = true;
    workspace = {
      theme       = "breeze-dark";
      colorScheme = "BreezeDarkote";
      windowDecorations.theme = "Klassy";
      windowDecorations.library = "org.kde.klassy";
    };
  };
}
