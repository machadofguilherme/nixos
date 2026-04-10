{ config, pkgs, ... }: {

  programs.plasma = {
    enable = true;
    workspace = {
      lookAndFeel = "org.kde.breezedark.desktop";
      theme = "breeze-dark";
      colorScheme = "BreezeDark";
      iconTheme = "breeze-dark";
    };

    kwin.effects = {
      shakeCursor.enable = false;
    };

    configFile."kwinrc"."Windows"."FocusPolicy" = "FocusFollowsMouse";
    configFile."dolphinrc"."General"."ViewPropsGroupView" = "Empty";
    configFile."dolphinrc"."Main View"."ShowHiddenFiles" = true;
  };
}
