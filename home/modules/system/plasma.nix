{ config, pkgs, ... }: {
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
        effects = {
          shakeCursor.enable = false;
        };

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

      input = {
        keyboard = {
          layouts = [
            {
              layout = "br";
            }
          ];
        };

        touchpads = [
          {
            enable = true;
            leftHanded = true;
            tapToClick = true;
            disableWhileTyping = false;
            middleButtonEmulation = true;
          }
        ];
      };

      configFile = {
        "kwinrc"."Windows"."FocusPolicy" = "FocusFollowsMouse";
        "dolphinrc"."General"."ViewPropsGroupView" = "Empty";
        "dolphinrc"."Main View"."ShowHiddenFiles" = true;
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
      defaultProfile = "Perfil 1";
    };
  };
}
