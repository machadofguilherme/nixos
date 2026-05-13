{ config, pkgs, ... }: {
  home.file.".local/share/plasma/plasmoids/weather.widget.plus".source = ./widgets/weather-plus;
  
  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "mauve";
  };

  programs = {
    plasma = {
      enable = true;

      workspace = {
        lookAndFeel = "catppuccin-mocha-mauve";
        cursor.theme = "Catppuccin-Mocha-Mauve-Cursors";
        iconTheme = "Papirus-Dark";
        wallpaperPictureOfTheDay = {
          updateOverMeteredConnection = true;
          provider = "bing";
        };
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
            "org.kde.plasma.kicker"
            "org.kde.plasma.pager"
            {
              name = "org.kde.plasma.icontasks";
              config = {
                General = {
                  launchers = [
                    "applications:org.kde.konsole.desktop"
                    "applications:org.kde.dolphin.desktop"
                    "applications:zen.desktop"
                  ];
                };
              };
            }
            "org.kde.plasma.panelspacer"
            "org.kde.plasma.systemtray"
            {
              name = "org.kde.plasma.digitalclock";
              config = {
                Appearance = {
                  use24hFormat = "2"; 
                  showDate = "true";
                  dateFormat = "custom"; 
                  customDateFormat = "d, dddd"; 
                };
              };
            }
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
