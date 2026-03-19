{ config, pkgs, ... }: {

  programs.plasma = {
    enable = true;

    workspace = {
      theme = "Breeze Dark";
      colorScheme = "BreezeDark";
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    fonts = {
      general = {
        family = "Noto Sans";
        pointSize = 10;
      };
    };

    configFile."kwinrc" = {
      "Windows" = {
        FocusPolicy = "FocusFollowsMouse";
      };
    };
  };
}
