{ config, pkgs, ... }: {
  home.file.".local/share/plasma/plasmoids/weather.widget.plus".source = ./widgets/weather-plus;

  programs = {
    plasma = {
      enable = true;

      workspace = {
        wallpaperPictureOfTheDay = {
          updateOverMeteredConnection = true;
          provider = "bing";
        };

        lookAndFeel = "org.kde.breezedark.desktop";
        colorScheme = "BreezeDark";
        iconTheme = "breeze-dark";
        theme = "breeze-dark";
      };

      kwin = {
        effects.shakeCursor.enable = false;
        nightLight = {
          enable = true;
          mode = "automatic";
        };

        virtualDesktops = {
          number = 4;
          rows = 2;
        };
      };

      krunner = {
        activateWhenTypingOnDesktop = true;
        shortcuts.launch = "Alt+Space";
        historyBehavior = "disabled";
        position = "center";
      };

      input.keyboard.layouts = [
        { layout = "br"; }
      ];

      panels = [
        {
          location = "bottom";
          height = 44;
          widgets = [
            "org.kde.plasma.kicker"
            "org.kde.plasma.pager"
            "org.kde.plasma.icontasks"
            "org.kde.plasma.panelspacer"
            {
              name = "weather.widget.plus";
              config = {
                Appearance = {
                  weatherStation = "Porto Alegre, Brazil";
                };
                Location = {
                  places = "[{\"providerId\":\"owm\",\"placeIdentifier\":\"3452925\",\"placeAlias\":\"Porto Alegre, Brasil\",\"timezoneID\":-1}]";
                  firstRun = "false";
                };
              };
            }
            "org.kde.plasma.panelspacer"
            "org.kde.plasma.systemtray"
            "org.kde.plasma.digitalclock"
            "org.kde.plasma.showdesktop"
          ];
        }
      ];

      configFile = {
        "dolphinrc"."Main View"."ShowHiddenFiles" = true;
        "dolphinrc"."General"."ViewPropsGroupView" = "Empty";
        "kwinrc"."Windows"."FocusPolicy" = "FocusFollowsMouse";
      };
    };

    kate = {
      editor = {
        tabWidth = 2;
        brackets = {
          automaticallyAddClosing = true;
          characters = "<>(){}[]'\"`*_~";
        };

        indent = {
          autodetect = true;
          backspaceDecreaseIndent = true;
        };
      };
    };

    konsole.defaultProfile = "Perfil 1";
  };
}
