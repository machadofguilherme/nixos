{ config, pkgs, ... }: {
  programs = {
    plasma = {
      enable = true;

      workspace = {
        lookAndFeel = "org.kde.breezedark.desktop";
        colorScheme = "BreezeDark";
        iconTheme = "breeze-dark";
        theme = "breeze-dark";
      };

      kwin.effects = {
        shakeCursor.enable = false;
      };

      krunner = {
        activateWhenTypingOnDesktop = true;
        shortcuts.launch = "Alt+Space";
        historyBehavior = "disabled";
        position = "center";
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
  };
}
