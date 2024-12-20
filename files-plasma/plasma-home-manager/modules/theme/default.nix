{ config, pkgs, ... }: {
  programs.plasma = {
    enable = true;
    workspace = {
      theme       = "breeze-dark";
      colorScheme = "BreezeDark";
      iconTheme   = "Colloid-Green-Dark";
      windowDecorations.theme = "Klassy";
      windowDecorations.library = "org.kde.klassy";
    };
  };
}
