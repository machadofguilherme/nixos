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

    panels = [
      {
        location = "top";
        height = 36;

        widgets = [
          "org.kde.plasma.kickoff"
          "org.kde.plasma.appmenu"
          "org.kde.plasma.panelspacer"
          "org.kde.plasma.systemtray"
          "org.kde.plasma.digitalclock"
        ];
      }

      {
        location = "bottom";
        height = 48;
        floating = true;
        alignment = "center";
        hiding = "autohide";
        lengthMode = "fit";

        widgets = [
          "org.kde.plasma.icontasks"
        ];
      }
    ];

    configFile."kwinrc" = {
      "Windows" = {
        FocusPolicy = "FocusFollowsMouse";
      };
    };
  };

  gtk = {
    enable = true;

    theme = {
      name = "Breeze-Dark";
      package = pkgs.kdePackages.breeze-gtk;
    };

    iconTheme = {
      name = "breeze-dark";
      package = pkgs.kdePackages.breeze-icons;
    };

    cursorTheme = {
      name = "Breeze Hacked";
      package = pkgs.breeze-hacked-cursor-theme;
      size = 24;
    };

    font = {
      name = "Noto Sans";
      size = 10;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = true;
    };
  };
}
