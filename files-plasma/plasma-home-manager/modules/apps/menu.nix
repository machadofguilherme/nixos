{ config, pkgs, ... }: {
  xdg.desktopEntries."fish" = {
    name = "fish";
    noDisplay = true;
  };
}
