{ config, pkgs, ... }: {
  home.file.".local/share/plasma/plasmoids/weather.widget.plus".source = ./widgets/weather-plus;

  catppuccin = {
    enable = true;
    flavor = "frappe";
    accent = "blue";
    kvantum.enable = true;
    vscode.profiles.default.enable = true;
  };

  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };

  programs = {
    plasma = {
      enable = true;

      workspace = {
        lookAndFeel = "catppuccin-frappe-blue";
        cursor.theme = "Catppuccin-Frappe-Blue-Cursors";
        colorScheme = "CatppuccinFrappeBlue";
        iconTheme = "Tela-nord-dark";
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

      input.keyboard.layouts = [{ layout = "br"; }];

      panels = [
        {
          location = "bottom";
          floating = true;
          height = 40;
          widgets = [
            {
              name = "weather.widget.plus";
              config = {
                Appearance.weatherStation = "Porto Alegre, Brazil";
                Location.places = "[{\"providerId\":\"owm\",\"placeIdentifier\":\"3452925\",\"placeAlias\":\"Porto Alegre, Brasil\",\"timezoneID\":-1}]";
                Location.firstRun = "false";
              };
            }
            "org.kde.plasma.panelspacer"
            "org.kde.plasma.kicker"
            "org.kde.plasma.pager"
            {
              name = "org.kde.plasma.icontasks";
              config.General.launchers = [
                "applications:org.kde.konsole.desktop"
                "applications:org.kde.dolphin.desktop"
                "applications:zen-beta.desktop"
              ];
            }
            "org.kde.plasma.panelspacer"
            "org.kde.plasma.systemtray"
            {
              name = "org.kde.plasma.digitalclock";
              config.Appearance = {
                use24hFormat = "2";
                showDate = "true";
                dateFormat = "custom";
                customDateFormat = "d/MM";
              };
            }
            "org.kde.plasma.showdesktop"
          ];
        }
      ];

      configFile = {
        "kwinrc"."Plugins"."blurEnabled" = true;
        "kwinrc"."Windows"."BorderConfig" = "NoBorders";
        "dolphinrc"."Main View"."ShowHiddenFiles" = true;
        "dolphinrc"."General"."ViewPropsGroupView" = "Empty";
        "kwinrc"."Windows"."FocusPolicy" = "FocusFollowsMouse";
        "kwinrc"."org.kde.kdecoration2"."library" = "org.kde.kwin.aurorae";
        "kwinrc"."org.kde.kdecoration2"."theme" = "CatppuccinFrappe-Modern";
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

    konsole = {
      enable = true;
      defaultProfile = "Perfil 1";
      profiles."Perfil 1" = {
        name = "Perfil 1";
        colorScheme = "Breeze";
        font = {
          name = "JetBrainsMono Nerd Font";
          size = 10;
        };

        extraConfig = {
          "Appearance" = {
            "CursorShape" = "IBeam";
          };

          "General" = {
            "Parent" = "";
            "BlinkingCursorEnabled" = true;
          };
        };
      };
    };
  };
}
